require "test_helper"

class LivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lives_index_url
    assert_response :success
  end

  test "should get show" do
    get lives_show_url
    assert_response :success
  end
end
