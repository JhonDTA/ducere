require 'application_system_test_case'

class EvaluationAttendancesTest < ApplicationSystemTestCase
  setup do
    @evaluation_attendance = evaluation_attendances(:one)
  end

  test 'visiting the index' do
    visit evaluation_attendances_url
    assert_selector 'h1', text: 'Evaluation Attendances'
  end

  test 'creating a Evaluation attendance' do
    visit evaluation_attendances_url
    click_on 'New Evaluation Attendance'

    fill_in 'Attendance type', with: @evaluation_attendance.attendance_type_id
    fill_in 'Course evaluation', with: @evaluation_attendance.course_evaluation_id
    fill_in 'Date', with: @evaluation_attendance.date
    fill_in 'Student', with: @evaluation_attendance.student_id
    click_on 'Create Evaluation attendance'

    assert_text 'Evaluation attendance was successfully created'
    click_on 'Back'
  end

  test 'updating a Evaluation attendance' do
    visit evaluation_attendances_url
    click_on 'Edit', match: :first

    fill_in 'Attendance type', with: @evaluation_attendance.attendance_type_id
    fill_in 'Course evaluation', with: @evaluation_attendance.course_evaluation_id
    fill_in 'Date', with: @evaluation_attendance.date
    fill_in 'Student', with: @evaluation_attendance.student_id
    click_on 'Update Evaluation attendance'

    assert_text 'Evaluation attendance was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Evaluation attendance' do
    visit evaluation_attendances_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Evaluation attendance was successfully destroyed'
  end
end
