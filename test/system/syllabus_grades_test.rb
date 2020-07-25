require "application_system_test_case"

class SyllabusGradesTest < ApplicationSystemTestCase
  setup do
    @syllabus_grade = syllabus_grades(:one)
  end

  test "visiting the index" do
    visit syllabus_grades_url
    assert_selector "h1", text: "Syllabus Grades"
  end

  test "creating a Syllabus grade" do
    visit syllabus_grades_url
    click_on "New Syllabus Grade"

    fill_in "Career syllabus", with: @syllabus_grade.career_syllabus_id
    fill_in "Grade", with: @syllabus_grade.grade_id
    click_on "Create Syllabus grade"

    assert_text "Syllabus grade was successfully created"
    click_on "Back"
  end

  test "updating a Syllabus grade" do
    visit syllabus_grades_url
    click_on "Edit", match: :first

    fill_in "Career syllabus", with: @syllabus_grade.career_syllabus_id
    fill_in "Grade", with: @syllabus_grade.grade_id
    click_on "Update Syllabus grade"

    assert_text "Syllabus grade was successfully updated"
    click_on "Back"
  end

  test "destroying a Syllabus grade" do
    visit syllabus_grades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Syllabus grade was successfully destroyed"
  end
end
