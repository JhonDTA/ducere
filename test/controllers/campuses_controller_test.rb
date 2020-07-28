require 'test_helper'

class CampusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus = campuses(:one)
  end

  test 'should get index' do
    get campuses_url
    assert_response :success
  end

  test 'should get new' do
    get new_campus_url
    assert_response :success
  end

  test 'should create campus' do
    assert_difference('Campus.count') do
      post campuses_url, params: { campus: { code: @campus.code, description: @campus.description, institution_id: @campus.institution_id, name: @campus.name, status_id: @campus.status_id } }
    end

    assert_redirected_to campus_url(Campus.last)
  end

  test 'should show campus' do
    get campus_url(@campus)
    assert_response :success
  end

  test 'should get edit' do
    get edit_campus_url(@campus)
    assert_response :success
  end

  test 'should update campus' do
    patch campus_url(@campus), params: { campus: { code: @campus.code, description: @campus.description, institution_id: @campus.institution_id, name: @campus.name, status_id: @campus.status_id } }
    assert_redirected_to campus_url(@campus)
  end

  test 'should destroy campus' do
    assert_difference('Campus.count', -1) do
      delete campus_url(@campus)
    end

    assert_redirected_to campuses_url
  end
end
