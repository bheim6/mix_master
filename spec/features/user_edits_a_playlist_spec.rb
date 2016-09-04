require 'rails_helper'

RSpec.feature "user can edit a playlist" do
  scenario "user can see updated data for an edited playlist" do
    playlist = create(:playlist_with_songs)
    first, second, third = playlist.songs
    new_song = create(:song, title: "New Song")
    new_name = "New Jamz"

    visit playlist_path(playlist)
    click_on "Edit Playlist"
    fill_in "playlist_name", with: new_name
    check("song-#{new_song.id}")
    uncheck("song-#{first.id}")
    click_on "Update Playlist"

    expect(page).to have_content new_name
    expect(page).to_not have_content playlist.name
    expect(page).to_not have_content first.title
    expect(page).to have_content new_song.title
  end
end
