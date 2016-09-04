require 'rails_helper'

RSpec.feature "user views all artists" do
  scenario "they can see all artists on the index page" do
    artist_name = "Bob Marley"
    artist_image_path = "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"

    visit "/artists"
    click_on "New Artist"
    fill_in "artist_name", with: artist_name
    fill_in "artist_image_path", with: artist_image_path
    click_on "Create Artist"
    visit '/artists'

    expect(page).to have_content artist_name

    click_on "#{artist_name}"

    expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
  end
end
