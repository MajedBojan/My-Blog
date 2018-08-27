require 'test_helper'

class AdminUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_index_url
    assert_response :success
  end

  test "should get access" do
    get admin_users_access_url
    assert_response :success
  end

end
