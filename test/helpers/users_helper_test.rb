require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test 'link_to_user links to a user by username' do
    user = User.first
    assert_equal link_to(user.username, user), link_to_user(user)
  end
end
