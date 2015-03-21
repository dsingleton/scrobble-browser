require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  test "lastfm_link returns the last.fm link" do
    artist = Artist.new(name: 'Foals')
    assert_equal "http://www.last.fm/music/Foals", artist.lastfm_link
  end
end
