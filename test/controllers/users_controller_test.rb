require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: "underpangs"}
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
