require "test_helper"

class PhotographsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get photographs_index_url
    assert_response :success
  end
end
