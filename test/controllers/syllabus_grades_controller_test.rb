# frozen_string_literal: true

require 'test_helper'

class SyllabusGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @syllabus_grade = syllabus_grades(:one)
  end

  test 'should get index' do
    get syllabus_grades_url
    assert_response :success
  end

  test 'should get new' do
    get new_syllabus_grade_url
    assert_response :success
  end

  test 'should create syllabus_grade' do
    assert_difference('SyllabusGrade.count') do
      post syllabus_grades_url, params: { syllabus_grade: { career_syllabus_id: @syllabus_grade.career_syllabus_id, grade_id: @syllabus_grade.grade_id } }
    end

    assert_redirected_to syllabus_grade_url(SyllabusGrade.last)
  end

  test 'should show syllabus_grade' do
    get syllabus_grade_url(@syllabus_grade)
    assert_response :success
  end

  test 'should get edit' do
    get edit_syllabus_grade_url(@syllabus_grade)
    assert_response :success
  end

  test 'should update syllabus_grade' do
    patch syllabus_grade_url(@syllabus_grade), params: { syllabus_grade: { career_syllabus_id: @syllabus_grade.career_syllabus_id, grade_id: @syllabus_grade.grade_id } }
    assert_redirected_to syllabus_grade_url(@syllabus_grade)
  end

  test 'should destroy syllabus_grade' do
    assert_difference('SyllabusGrade.count', -1) do
      delete syllabus_grade_url(@syllabus_grade)
    end

    assert_redirected_to syllabus_grades_url
  end
end
