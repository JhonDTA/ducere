require 'test_helper'

class CycleTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cycle_type = cycle_types(:one)
  end

  test 'should get index' do
    get cycle_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_cycle_type_url
    assert_response :success
  end

  test 'should create cycle_type' do
    assert_difference('CycleType.count') do
      post cycle_types_url, params: { cycle_type: { code: @cycle_type.code, description: @cycle_type.description, duration: @cycle_type.duration, name: @cycle_type.name, status_id: @cycle_type.status_id } }
    end

    assert_redirected_to cycle_type_url(CycleType.last)
  end

  test 'should show cycle_type' do
    get cycle_type_url(@cycle_type)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cycle_type_url(@cycle_type)
    assert_response :success
  end

  test 'should update cycle_type' do
    patch cycle_type_url(@cycle_type), params: { cycle_type: { code: @cycle_type.code, description: @cycle_type.description, duration: @cycle_type.duration, name: @cycle_type.name, status_id: @cycle_type.status_id } }
    assert_redirected_to cycle_type_url(@cycle_type)
  end

  test 'should destroy cycle_type' do
    assert_difference('CycleType.count', -1) do
      delete cycle_type_url(@cycle_type)
    end

    assert_redirected_to cycle_types_url
  end
end
