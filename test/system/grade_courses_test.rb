require "application_system_test_case"

class GradeCoursesTest < ApplicationSystemTestCase
  setup do
    @grade_course = grade_courses(:one)
  end

  test "visiting the index" do
    visit grade_courses_url
    assert_selector "h1", text: "Grade Courses"
  end

  test "creating a Grade course" do
    visit grade_courses_url
    click_on "New Grade Course"

    fill_in "Course", with: @grade_course.course_id
    fill_in "Syllabus grade", with: @grade_course.syllabus_grade_id
    click_on "Create Grade course"

    assert_text "Grade course was successfully created"
    click_on "Back"
  end

  test "updating a Grade course" do
    visit grade_courses_url
    click_on "Edit", match: :first

    fill_in "Course", with: @grade_course.course_id
    fill_in "Syllabus grade", with: @grade_course.syllabus_grade_id
    click_on "Update Grade course"

    assert_text "Grade course was successfully updated"
    click_on "Back"
  end

  test "destroying a Grade course" do
    visit grade_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Grade course was successfully destroyed"
  end
end
