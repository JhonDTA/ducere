# frozen_string_literal: true

require 'test_helper'

class CourseHomeworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_homework = course_homeworks(:one)
  end

  test 'should get index' do
    get course_homeworks_url
    assert_response :success
  end

  test 'should get new' do
    get new_course_homework_url
    assert_response :success
  end

  test 'should create course_homework' do
    assert_difference('CourseHomework.count') do
      post course_homeworks_url, params: { course_homework: { course_evaluation_id: @course_homework.course_evaluation_id, description: @course_homework.description, name: @course_homework.name } }
    end

    assert_redirected_to course_homework_url(CourseHomework.last)
  end

  test 'should show course_homework' do
    get course_homework_url(@course_homework)
    assert_response :success
  end

  test 'should get edit' do
    get edit_course_homework_url(@course_homework)
    assert_response :success
  end

  test 'should update course_homework' do
    patch course_homework_url(@course_homework), params: { course_homework: { course_evaluation_id: @course_homework.course_evaluation_id, description: @course_homework.description, name: @course_homework.name } }
    assert_redirected_to course_homework_url(@course_homework)
  end

  test 'should destroy course_homework' do
    assert_difference('CourseHomework.count', -1) do
      delete course_homework_url(@course_homework)
    end

    assert_redirected_to course_homeworks_url
  end
end
