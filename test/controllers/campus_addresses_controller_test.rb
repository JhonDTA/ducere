# frozen_string_literal: true

require 'test_helper'

class CampusAddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus_address = campus_addresses(:one)
  end

  test 'should get index' do
    get campus_addresses_url
    assert_response :success
  end

  test 'should get new' do
    get new_campus_address_url
    assert_response :success
  end

  test 'should create campus_address' do
    assert_difference('CampusAddress.count') do
      post campus_addresses_url, params: { campus_address: { address_id: @campus_address.address_id, campus_id: @campus_address.campus_id } }
    end

    assert_redirected_to campus_address_url(CampusAddress.last)
  end

  test 'should show campus_address' do
    get campus_address_url(@campus_address)
    assert_response :success
  end

  test 'should get edit' do
    get edit_campus_address_url(@campus_address)
    assert_response :success
  end

  test 'should update campus_address' do
    patch campus_address_url(@campus_address), params: { campus_address: { address_id: @campus_address.address_id, campus_id: @campus_address.campus_id } }
    assert_redirected_to campus_address_url(@campus_address)
  end

  test 'should destroy campus_address' do
    assert_difference('CampusAddress.count', -1) do
      delete campus_address_url(@campus_address)
    end

    assert_redirected_to campus_addresses_url
  end
end
