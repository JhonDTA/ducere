require 'test_helper'

class CourseMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_mark = course_marks(:one)
  end

  test 'should get index' do
    get course_marks_url
    assert_response :success
  end

  test 'should get new' do
    get new_course_mark_url
    assert_response :success
  end

  test 'should create course_mark' do
    assert_difference('CourseMark.count') do
      post course_marks_url, params: { course_mark: { attendance: @course_mark.attendance, mark: @course_mark.mark, observations: @course_mark.observations, student_course_id: @course_mark.student_course_id } }
    end

    assert_redirected_to course_mark_url(CourseMark.last)
  end

  test 'should show course_mark' do
    get course_mark_url(@course_mark)
    assert_response :success
  end

  test 'should get edit' do
    get edit_course_mark_url(@course_mark)
    assert_response :success
  end

  test 'should update course_mark' do
    patch course_mark_url(@course_mark), params: { course_mark: { attendance: @course_mark.attendance, mark: @course_mark.mark, observations: @course_mark.observations, student_course_id: @course_mark.student_course_id } }
    assert_redirected_to course_mark_url(@course_mark)
  end

  test 'should destroy course_mark' do
    assert_difference('CourseMark.count', -1) do
      delete course_mark_url(@course_mark)
    end

    assert_redirected_to course_marks_url
  end
end
