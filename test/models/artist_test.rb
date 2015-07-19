require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  test "lastfm_link returns the last.fm link" do
    artist = Artist.new(name: 'Foals')
    assert_equal "http://www.last.fm/music/Foals", artist.lastfm_link
  end

  test "self.find_by_name is case-insensitive" do
    artist = Artist.first
    assert_equal artist, Artist.find_by_name(artist.name)
    assert_equal artist, Artist.find_by_name(artist.name.upcase)
    assert_equal artist, Artist.find_by_name(artist.name.downcase)
  end
end
