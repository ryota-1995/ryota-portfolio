require "test_helper"

class IdolsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get idols_index_url
    assert_response :success
  end
end
