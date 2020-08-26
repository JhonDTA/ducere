require "application_system_test_case"

class InstutionAddressesTest < ApplicationSystemTestCase
  setup do
    @instution_address = instution_addresses(:one)
  end

  test "visiting the index" do
    visit instution_addresses_url
    assert_selector "h1", text: "Instution Addresses"
  end

  test "creating a Instution address" do
    visit instution_addresses_url
    click_on "New Instution Address"

    fill_in "Address", with: @instution_address.address_id
    fill_in "Institution", with: @instution_address.institution_id
    click_on "Create Instution address"

    assert_text "Instution address was successfully created"
    click_on "Back"
  end

  test "updating a Instution address" do
    visit instution_addresses_url
    click_on "Edit", match: :first

    fill_in "Address", with: @instution_address.address_id
    fill_in "Institution", with: @instution_address.institution_id
    click_on "Update Instution address"

    assert_text "Instution address was successfully updated"
    click_on "Back"
  end

  test "destroying a Instution address" do
    visit instution_addresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Instution address was successfully destroyed"
  end
end
