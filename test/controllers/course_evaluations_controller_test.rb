# frozen_string_literal: true

require 'test_helper'

class CourseEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_evaluation = course_evaluations(:one)
  end

  test 'should get index' do
    get course_evaluations_url
    assert_response :success
  end

  test 'should get new' do
    get new_course_evaluation_url
    assert_response :success
  end

  test 'should create course_evaluation' do
    assert_difference('CourseEvaluation.count') do
      post course_evaluations_url, params: { course_evaluation: { campus_evaluation_id: @course_evaluation.campus_evaluation_id, grade_course_id: @course_evaluation.grade_course_id, group_id: @course_evaluation.group_id, professor_id: @course_evaluation.professor_id } }
    end

    assert_redirected_to course_evaluation_url(CourseEvaluation.last)
  end

  test 'should show course_evaluation' do
    get course_evaluation_url(@course_evaluation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_course_evaluation_url(@course_evaluation)
    assert_response :success
  end

  test 'should update course_evaluation' do
    patch course_evaluation_url(@course_evaluation), params: { course_evaluation: { campus_evaluation_id: @course_evaluation.campus_evaluation_id, grade_course_id: @course_evaluation.grade_course_id, group_id: @course_evaluation.group_id, professor_id: @course_evaluation.professor_id } }
    assert_redirected_to course_evaluation_url(@course_evaluation)
  end

  test 'should destroy course_evaluation' do
    assert_difference('CourseEvaluation.count', -1) do
      delete course_evaluation_url(@course_evaluation)
    end

    assert_redirected_to course_evaluations_url
  end
end
