require 'test_helper'

class ScrobblesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index scoped to user" do
    get :index, {user_id: User.first}
    assert_response :success
  end

  test "should get index scoped to artist" do
    get :index, {artist_id: Artist.first}
    assert_response :success
  end

  test "should get index scoped to track" do
    get :index, {artist_id: Artist.first, track_id: Artist.first.tracks.first}
    assert_response :success
  end
end
