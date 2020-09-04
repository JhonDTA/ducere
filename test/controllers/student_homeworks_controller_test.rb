# frozen_string_literal: true

require 'test_helper'

class StudentHomeworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_homework = student_homeworks(:one)
  end

  test 'should get index' do
    get student_homeworks_url
    assert_response :success
  end

  test 'should get new' do
    get new_student_homework_url
    assert_response :success
  end

  test 'should create student_homework' do
    assert_difference('StudentHomework.count') do
      post student_homeworks_url, params: { student_homework: { course_homework_id: @student_homework.course_homework_id, observations: @student_homework.observations, student_id: @student_homework.student_id } }
    end

    assert_redirected_to student_homework_url(StudentHomework.last)
  end

  test 'should show student_homework' do
    get student_homework_url(@student_homework)
    assert_response :success
  end

  test 'should get edit' do
    get edit_student_homework_url(@student_homework)
    assert_response :success
  end

  test 'should update student_homework' do
    patch student_homework_url(@student_homework), params: { student_homework: { course_homework_id: @student_homework.course_homework_id, observations: @student_homework.observations, student_id: @student_homework.student_id } }
    assert_redirected_to student_homework_url(@student_homework)
  end

  test 'should destroy student_homework' do
    assert_difference('StudentHomework.count', -1) do
      delete student_homework_url(@student_homework)
    end

    assert_redirected_to student_homeworks_url
  end
end
