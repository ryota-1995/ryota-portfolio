require "test_helper"

class NewControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get new_login_url
    assert_response :success
  end

  test "should get index" do
    get new_index_url
    assert_response :success
  end

  test "should get create" do
    get new_create_url
    assert_response :success
  end

  test "should get update" do
    get new_update_url
    assert_response :success
  end
end
