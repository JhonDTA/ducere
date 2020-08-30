require 'application_system_test_case'

class UserAddressesTest < ApplicationSystemTestCase
  setup do
    @user_address = user_addresses(:one)
  end

  test 'visiting the index' do
    visit user_addresses_url
    assert_selector 'h1', text: 'User Addresses'
  end

  test 'creating a User address' do
    visit user_addresses_url
    click_on 'New User Address'

    fill_in 'Address', with: @user_address.address_id
    fill_in 'User', with: @user_address.user_id
    click_on 'Create User address'

    assert_text 'User address was successfully created'
    click_on 'Back'
  end

  test 'updating a User address' do
    visit user_addresses_url
    click_on 'Edit', match: :first

    fill_in 'Address', with: @user_address.address_id
    fill_in 'User', with: @user_address.user_id
    click_on 'Update User address'

    assert_text 'User address was successfully updated'
    click_on 'Back'
  end

  test 'destroying a User address' do
    visit user_addresses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'User address was successfully destroyed'
  end
end
