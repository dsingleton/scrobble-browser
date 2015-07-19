require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  test "lastfm_link returns the last.fm link" do
    track = Track.new(name: 'Balloons', artist: Artist.new(name: 'Foals'))
    assert_equal "http://www.last.fm/music/Foals/_/Balloons", track.lastfm_link
  end

  test "self.find_by_name is case-insensitive" do
    track = Track.first
    assert_equal track, Track.find_by_name(track.name)
    assert_equal track, Track.find_by_name(track.name.upcase)
    assert_equal track, Track.find_by_name(track.name.downcase)
  end
end
