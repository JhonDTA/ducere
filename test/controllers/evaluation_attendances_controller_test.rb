# frozen_string_literal: true

require 'test_helper'

class EvaluationAttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluation_attendance = evaluation_attendances(:one)
  end

  test 'should get index' do
    get evaluation_attendances_url
    assert_response :success
  end

  test 'should get new' do
    get new_evaluation_attendance_url
    assert_response :success
  end

  test 'should create evaluation_attendance' do
    assert_difference('EvaluationAttendance.count') do
      post evaluation_attendances_url, params: { evaluation_attendance: { attendance_type_id: @evaluation_attendance.attendance_type_id, course_evaluation_id: @evaluation_attendance.course_evaluation_id, date: @evaluation_attendance.date, student_id: @evaluation_attendance.student_id } }
    end

    assert_redirected_to evaluation_attendance_url(EvaluationAttendance.last)
  end

  test 'should show evaluation_attendance' do
    get evaluation_attendance_url(@evaluation_attendance)
    assert_response :success
  end

  test 'should get edit' do
    get edit_evaluation_attendance_url(@evaluation_attendance)
    assert_response :success
  end

  test 'should update evaluation_attendance' do
    patch evaluation_attendance_url(@evaluation_attendance), params: { evaluation_attendance: { attendance_type_id: @evaluation_attendance.attendance_type_id, course_evaluation_id: @evaluation_attendance.course_evaluation_id, date: @evaluation_attendance.date, student_id: @evaluation_attendance.student_id } }
    assert_redirected_to evaluation_attendance_url(@evaluation_attendance)
  end

  test 'should destroy evaluation_attendance' do
    assert_difference('EvaluationAttendance.count', -1) do
      delete evaluation_attendance_url(@evaluation_attendance)
    end

    assert_redirected_to evaluation_attendances_url
  end
end
