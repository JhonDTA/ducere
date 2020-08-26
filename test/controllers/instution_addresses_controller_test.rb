require 'test_helper'

class InstutionAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instution_address = instution_addresses(:one)
  end

  test "should get index" do
    get instution_addresses_url
    assert_response :success
  end

  test "should get new" do
    get new_instution_address_url
    assert_response :success
  end

  test "should create instution_address" do
    assert_difference('InstutionAddress.count') do
      post instution_addresses_url, params: { instution_address: { address_id: @instution_address.address_id, institution_id: @instution_address.institution_id } }
    end

    assert_redirected_to instution_address_url(InstutionAddress.last)
  end

  test "should show instution_address" do
    get instution_address_url(@instution_address)
    assert_response :success
  end

  test "should get edit" do
    get edit_instution_address_url(@instution_address)
    assert_response :success
  end

  test "should update instution_address" do
    patch instution_address_url(@instution_address), params: { instution_address: { address_id: @instution_address.address_id, institution_id: @instution_address.institution_id } }
    assert_redirected_to instution_address_url(@instution_address)
  end

  test "should destroy instution_address" do
    assert_difference('InstutionAddress.count', -1) do
      delete instution_address_url(@instution_address)
    end

    assert_redirected_to instution_addresses_url
  end
end
