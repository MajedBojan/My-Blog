require 'test_helper'

class ProfileimagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profileimages_index_url
    assert_response :success
  end

  test "should get show" do
    get profileimages_show_url
    assert_response :success
  end

  test "should get new" do
    get profileimages_new_url
    assert_response :success
  end

  test "should get edit" do
    get profileimages_edit_url
    assert_response :success
  end

  test "should get delete" do
    get profileimages_delete_url
    assert_response :success
  end

end
