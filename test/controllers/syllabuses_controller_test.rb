require 'test_helper'

class SyllabusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @syllabus = syllabuses(:one)
  end

  test 'should get index' do
    get syllabuses_url
    assert_response :success
  end

  test 'should get new' do
    get new_syllabus_url
    assert_response :success
  end

  test 'should create syllabus' do
    assert_difference('Syllabus.count') do
      post syllabuses_url, params: { syllabus: { approval_credits: @syllabus.approval_credits, career_id: @syllabus.career_id,
                                                 code: @syllabus.code, description: @syllabus.description, name: @syllabus.name, status_id: @syllabus.status_id } }
    end

    assert_redirected_to syllabus_url(Syllabus.last)
  end

  test 'should show syllabus' do
    get syllabus_url(@syllabus)
    assert_response :success
  end

  test 'should get edit' do
    get edit_syllabus_url(@syllabus)
    assert_response :success
  end

  test 'should update syllabus' do
    patch syllabus_url(@syllabus), params: { syllabus: { approval_credits: @syllabus.approval_credits, career_id: @syllabus.career_id,
                                                         code: @syllabus.code, description: @syllabus.description, name: @syllabus.name, status_id: @syllabus.status_id } }
    assert_redirected_to syllabus_url(@syllabus)
  end

  test 'should destroy syllabus' do
    assert_difference('Syllabus.count', -1) do
      delete syllabus_url(@syllabus)
    end

    assert_redirected_to syllabuses_url
  end
end
