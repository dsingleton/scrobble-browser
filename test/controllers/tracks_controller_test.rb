require 'test_helper'

class TracksControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index for artist scope" do
    get :index, {artist_id: "Dntel"}
    assert_response :success
  end

  test "should 404 when showing unknown artist" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :index, {artist_id: "aaa"}
    end
  end

  test "should get show for artist scope" do
    get :show, {artist_id: "Dntel", id: "Umbrella"}
    assert_response :success
  end

  test "should 404 when showing unknown track" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, {artist_id: "Dntel", id: "Umbrellaaa"}
    end
  end

  test "index scoped to used should hide user" do
    get :index, {user_id: User.first}
    assert_select 'th', {text: 'User', count: 0}
  end

  test "index scoped to used should hide artist" do
    get :index, {artist_id: Artist.first}
    assert_select 'th', {text: 'Artist', count: 0}
  end
end
