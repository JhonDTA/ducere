require 'test_helper'

class EducativeLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @educative_level = educative_levels(:one)
  end

  test 'should get index' do
    get educative_levels_url
    assert_response :success
  end

  test 'should get new' do
    get new_educative_level_url
    assert_response :success
  end

  test 'should create educative_level' do
    assert_difference('EducativeLevel.count') do
      post educative_levels_url, params: { educative_level: { code: @educative_level.code, description: @educative_level.description, name: @educative_level.name, status_id: @educative_level.status_id } }
    end

    assert_redirected_to educative_level_url(EducativeLevel.last)
  end

  test 'should show educative_level' do
    get educative_level_url(@educative_level)
    assert_response :success
  end

  test 'should get edit' do
    get edit_educative_level_url(@educative_level)
    assert_response :success
  end

  test 'should update educative_level' do
    patch educative_level_url(@educative_level), params: { educative_level: { code: @educative_level.code, description: @educative_level.description, name: @educative_level.name, status_id: @educative_level.status_id } }
    assert_redirected_to educative_level_url(@educative_level)
  end

  test 'should destroy educative_level' do
    assert_difference('EducativeLevel.count', -1) do
      delete educative_level_url(@educative_level)
    end

    assert_redirected_to educative_levels_url
  end
end
