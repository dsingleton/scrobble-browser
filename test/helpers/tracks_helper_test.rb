require 'test_helper'

class TracksHelperTest < ActionView::TestCase
  test 'link_to_track links to track and artist' do
    track = Track.first
    assert_equal link_to(track.name, [track.artist, track]), link_to_track(track)
  end
end
