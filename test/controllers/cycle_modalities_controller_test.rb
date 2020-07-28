require 'test_helper'

class CycleModalitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cycle_modality = cycle_modalities(:one)
  end

  test 'should get index' do
    get cycle_modalities_url
    assert_response :success
  end

  test 'should get new' do
    get new_cycle_modality_url
    assert_response :success
  end

  test 'should create cycle_modality' do
    assert_difference('CycleModality.count') do
      post cycle_modalities_url, params: { cycle_modality: { academic_cycle_id: @cycle_modality.academic_cycle_id, modality_id: @cycle_modality.modality_id } }
    end

    assert_redirected_to cycle_modality_url(CycleModality.last)
  end

  test 'should show cycle_modality' do
    get cycle_modality_url(@cycle_modality)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cycle_modality_url(@cycle_modality)
    assert_response :success
  end

  test 'should update cycle_modality' do
    patch cycle_modality_url(@cycle_modality), params: { cycle_modality: { academic_cycle_id: @cycle_modality.academic_cycle_id, modality_id: @cycle_modality.modality_id } }
    assert_redirected_to cycle_modality_url(@cycle_modality)
  end

  test 'should destroy cycle_modality' do
    assert_difference('CycleModality.count', -1) do
      delete cycle_modality_url(@cycle_modality)
    end

    assert_redirected_to cycle_modalities_url
  end
end
