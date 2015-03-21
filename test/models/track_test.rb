require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  test "lastfm_link returns the last.fm link" do
    track = Track.new(name: 'Balloons', artist: Artist.new(name: 'Foals'))
    assert_equal "http://www.last.fm/music/Foals/_/Balloons", track.lastfm_link
  end
end
