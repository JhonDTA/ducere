require "application_system_test_case"

class CampusAddressesTest < ApplicationSystemTestCase
  setup do
    @campus_address = campus_addresses(:one)
  end

  test "visiting the index" do
    visit campus_addresses_url
    assert_selector "h1", text: "Campus Addresses"
  end

  test "creating a Campus address" do
    visit campus_addresses_url
    click_on "New Campus Address"

    fill_in "Address", with: @campus_address.address_id
    fill_in "Campus", with: @campus_address.campus_id
    click_on "Create Campus address"

    assert_text "Campus address was successfully created"
    click_on "Back"
  end

  test "updating a Campus address" do
    visit campus_addresses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @campus_address.address_id
    fill_in "Campus", with: @campus_address.campus_id
    click_on "Update Campus address"

    assert_text "Campus address was successfully updated"
    click_on "Back"
  end

  test "destroying a Campus address" do
    visit campus_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Campus address was successfully destroyed"
  end
end
