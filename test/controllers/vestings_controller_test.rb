require "test_helper"

class VestingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vesting = vestings(:one)
  end

  test "should get index" do
    get vestings_url
    assert_response :success
  end

  test "should get new" do
    get new_vesting_url
    assert_response :success
  end

  test "should create vesting" do
    assert_difference("Vesting.count") do
      post vestings_url, params: { vesting: { date: @vesting.date, rate: @vesting.rate, return: @vesting.return, soldtoken: @vesting.soldtoken } }
    end

    assert_redirected_to vesting_url(Vesting.last)
  end

  test "should show vesting" do
    get vesting_url(@vesting)
    assert_response :success
  end

  test "should get edit" do
    get edit_vesting_url(@vesting)
    assert_response :success
  end

  test "should update vesting" do
    patch vesting_url(@vesting), params: { vesting: { date: @vesting.date, rate: @vesting.rate, return: @vesting.return, soldtoken: @vesting.soldtoken } }
    assert_redirected_to vesting_url(@vesting)
  end

  test "should destroy vesting" do
    assert_difference("Vesting.count", -1) do
      delete vesting_url(@vesting)
    end

    assert_redirected_to vestings_url
  end
end
