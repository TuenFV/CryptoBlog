require "test_helper"

class PricesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prices_index_url
    assert_response :success
  end

  test "should get create" do
    get prices_create_url
    assert_response :success
  end

  test "should get update" do
    get prices_update_url
    assert_response :success
  end
end
