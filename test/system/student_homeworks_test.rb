require "application_system_test_case"

class StudentHomeworksTest < ApplicationSystemTestCase
  setup do
    @student_homework = student_homeworks(:one)
  end

  test "visiting the index" do
    visit student_homeworks_url
    assert_selector "h1", text: "Student Homeworks"
  end

  test "creating a Student homework" do
    visit student_homeworks_url
    click_on "New Student Homework"

    fill_in "Course homework", with: @student_homework.course_homework_id
    fill_in "Observations", with: @student_homework.observations
    fill_in "Student", with: @student_homework.student_id
    click_on "Create Student homework"

    assert_text "Student homework was successfully created"
    click_on "Back"
  end

  test "updating a Student homework" do
    visit student_homeworks_url
    click_on "Edit", match: :first

    fill_in "Course homework", with: @student_homework.course_homework_id
    fill_in "Observations", with: @student_homework.observations
    fill_in "Student", with: @student_homework.student_id
    click_on "Update Student homework"

    assert_text "Student homework was successfully updated"
    click_on "Back"
  end

  test "destroying a Student homework" do
    visit student_homeworks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student homework was successfully destroyed"
  end
end
