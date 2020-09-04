# frozen_string_literal: true

require 'test_helper'

class ProfessorCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @professor_course = professor_courses(:one)
  end

  test 'should get index' do
    get professor_courses_url
    assert_response :success
  end

  test 'should get new' do
    get new_professor_course_url
    assert_response :success
  end

  test 'should create professor_course' do
    assert_difference('ProfessorCourse.count') do
      post professor_courses_url, params: { professor_course: { course_id: @professor_course.course_id, professor_id: @professor_course.professor_id } }
    end

    assert_redirected_to professor_course_url(ProfessorCourse.last)
  end

  test 'should show professor_course' do
    get professor_course_url(@professor_course)
    assert_response :success
  end

  test 'should get edit' do
    get edit_professor_course_url(@professor_course)
    assert_response :success
  end

  test 'should update professor_course' do
    patch professor_course_url(@professor_course), params: { professor_course: { course_id: @professor_course.course_id, professor_id: @professor_course.professor_id } }
    assert_redirected_to professor_course_url(@professor_course)
  end

  test 'should destroy professor_course' do
    assert_difference('ProfessorCourse.count', -1) do
      delete professor_course_url(@professor_course)
    end

    assert_redirected_to professor_courses_url
  end
end
