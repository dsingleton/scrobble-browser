require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, {id: "Dntel"}
    assert_response :success
  end

  test "should get index for user scope" do
    get :index, {user_id: User.first}
    assert_response :success
  end

end
