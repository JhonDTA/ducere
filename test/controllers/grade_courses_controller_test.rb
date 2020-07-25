require 'test_helper'

class GradeCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grade_course = grade_courses(:one)
  end

  test "should get index" do
    get grade_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_grade_course_url
    assert_response :success
  end

  test "should create grade_course" do
    assert_difference('GradeCourse.count') do
      post grade_courses_url, params: { grade_course: { course_id: @grade_course.course_id, syllabus_grade_id: @grade_course.syllabus_grade_id } }
    end

    assert_redirected_to grade_course_url(GradeCourse.last)
  end

  test "should show grade_course" do
    get grade_course_url(@grade_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_grade_course_url(@grade_course)
    assert_response :success
  end

  test "should update grade_course" do
    patch grade_course_url(@grade_course), params: { grade_course: { course_id: @grade_course.course_id, syllabus_grade_id: @grade_course.syllabus_grade_id } }
    assert_redirected_to grade_course_url(@grade_course)
  end

  test "should destroy grade_course" do
    assert_difference('GradeCourse.count', -1) do
      delete grade_course_url(@grade_course)
    end

    assert_redirected_to grade_courses_url
  end
end
