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

  test "index scoped to used should hide user" do
    get :index, {user_id: User.first}
    assert_select 'th', {text: 'User', count: 0}
  end

  test "index scoped to track should hide artist " do
    get :index, {artist_id: Artist.first}
    assert_select 'th', {text: 'Artist', count: 0}
  end

  test "index scoped to track should hide artist and track" do
    get :index, {artist_id: Artist.first, track_id: Artist.first.tracks.first}
    assert_select 'th', {text: 'Artist', count: 0}
    assert_select 'th', {text: 'Trck', count: 0}
  end
end
