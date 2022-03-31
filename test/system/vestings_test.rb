require "application_system_test_case"

class VestingsTest < ApplicationSystemTestCase
  setup do
    @vesting = vestings(:one)
  end

  test "visiting the index" do
    visit vestings_url
    assert_selector "h1", text: "Vestings"
  end

  test "should create vesting" do
    visit vestings_url
    click_on "New vesting"

    fill_in "Date", with: @vesting.date
    fill_in "Rate", with: @vesting.rate
    fill_in "Return", with: @vesting.return
    fill_in "Soldtoken", with: @vesting.soldtoken
    click_on "Create Vesting"

    assert_text "Vesting was successfully created"
    click_on "Back"
  end

  test "should update Vesting" do
    visit vesting_url(@vesting)
    click_on "Edit this vesting", match: :first

    fill_in "Date", with: @vesting.date
    fill_in "Rate", with: @vesting.rate
    fill_in "Return", with: @vesting.return
    fill_in "Soldtoken", with: @vesting.soldtoken
    click_on "Update Vesting"

    assert_text "Vesting was successfully updated"
    click_on "Back"
  end

  test "should destroy Vesting" do
    visit vesting_url(@vesting)
    click_on "Destroy this vesting", match: :first

    assert_text "Vesting was successfully destroyed"
  end
end
