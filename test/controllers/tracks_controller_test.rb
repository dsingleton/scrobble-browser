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

  test "should get show for artist scope" do
    get :show, {artist_id: "Dntel", id: "Umbrella"}
    assert_response :success
  end
end
