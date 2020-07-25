require 'test_helper'

class StudentCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student_course = student_courses(:one)
  end

  test "should get index" do
    get student_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_student_course_url
    assert_response :success
  end

  test "should create student_course" do
    assert_difference('StudentCourse.count') do
      post student_courses_url, params: { student_course: { attendance: @student_course.attendance, course_evaluation_id: @student_course.course_evaluation_id, mark: @student_course.mark, observations: @student_course.observations, student_id: @student_course.student_id } }
    end

    assert_redirected_to student_course_url(StudentCourse.last)
  end

  test "should show student_course" do
    get student_course_url(@student_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_course_url(@student_course)
    assert_response :success
  end

  test "should update student_course" do
    patch student_course_url(@student_course), params: { student_course: { attendance: @student_course.attendance, course_evaluation_id: @student_course.course_evaluation_id, mark: @student_course.mark, observations: @student_course.observations, student_id: @student_course.student_id } }
    assert_redirected_to student_course_url(@student_course)
  end

  test "should destroy student_course" do
    assert_difference('StudentCourse.count', -1) do
      delete student_course_url(@student_course)
    end

    assert_redirected_to student_courses_url
  end
end
