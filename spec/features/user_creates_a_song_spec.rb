require 'rails_helper'

RSpec.feature "user submits a new song" do
  scenario "they can see the page for an indivicual song" do
    artist = create(:artist)

    song_title = "Iron Lion Zion"

    visit artist_path(artist)
    click_on "New Song"
    fill_in "song_title", with: song_title
    click_on "Create Song"

    expect(page).to have_content song_title
    expect(page).to have_link artist.name, href: artist_path(artist)
  end

  context "the data submitted is invalid" do
    scenario "they cannot leave song title blank" do
      artist = create(:artist)

      visit artist_path(artist)
      click_on "New Song"
      click_on "Create Song"

      expect(page).to have_content "Title can't be blank"
    end
  end
end
