require 'test_helper'

class TracksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, {artist_id: Artist.first}
    assert_response :success
  end

  test "should get show" do
    track = Track.first
    get :show, {artist_id: track.artist_id, id: track.id}
    assert_response :success
  end

end
