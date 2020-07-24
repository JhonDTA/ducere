require "application_system_test_case"

class AttendanceTypesTest < ApplicationSystemTestCase
  setup do
    @attendance_type = attendance_types(:one)
  end

  test "visiting the index" do
    visit attendance_types_url
    assert_selector "h1", text: "Attendance Types"
  end

  test "creating a Attendance type" do
    visit attendance_types_url
    click_on "New Attendance Type"

    fill_in "Code", with: @attendance_type.code
    fill_in "Description", with: @attendance_type.description
    fill_in "Name", with: @attendance_type.name
    fill_in "Status", with: @attendance_type.status_id
    click_on "Create Attendance type"

    assert_text "Attendance type was successfully created"
    click_on "Back"
  end

  test "updating a Attendance type" do
    visit attendance_types_url
    click_on "Edit", match: :first

    fill_in "Code", with: @attendance_type.code
    fill_in "Description", with: @attendance_type.description
    fill_in "Name", with: @attendance_type.name
    fill_in "Status", with: @attendance_type.status_id
    click_on "Update Attendance type"

    assert_text "Attendance type was successfully updated"
    click_on "Back"
  end

  test "destroying a Attendance type" do
    visit attendance_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attendance type was successfully destroyed"
  end
end
