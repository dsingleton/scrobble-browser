require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should find artist for known artist" do
    get :show, {id: "Dntel"}
    assert_response :success
  end

  test "should 404 when showing unknown artist" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, {id: "Dntelxxx"}
    end
  end

  test "should get index for user scope" do
    get :index, {user_id: User.first}
    assert_response :success
  end

end
