require 'test_helper'

class AlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index, {artist_id: "Dntel"}
    assert_response :success
  end

  test "should get show" do
    get :show, {artist_id: "Dntel", id: "Life Is Full of Possibilities"}
    assert_response :success
  end
end
