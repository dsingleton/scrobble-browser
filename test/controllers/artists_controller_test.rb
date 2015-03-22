require 'test_helper'

class ArtistsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    artist = Artist.first
    get :show, {id: artist.id}
    assert_response :success
  end

end
