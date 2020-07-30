require 'application_system_test_case'

class CourseMarksTest < ApplicationSystemTestCase
  setup do
    @course_mark = course_marks(:one)
  end

  test 'visiting the index' do
    visit course_marks_url
    assert_selector 'h1', text: 'Course Marks'
  end

  test 'creating a Course mark' do
    visit course_marks_url
    click_on 'New Course Mark'

    fill_in 'Attendance', with: @course_mark.attendance
    fill_in 'Mark', with: @course_mark.mark
    fill_in 'Observations', with: @course_mark.observations
    fill_in 'Student course', with: @course_mark.student_course_id
    click_on 'Create Course mark'

    assert_text 'Course mark was successfully created'
    click_on 'Back'
  end

  test 'updating a Course mark' do
    visit course_marks_url
    click_on 'Edit', match: :first

    fill_in 'Attendance', with: @course_mark.attendance
    fill_in 'Mark', with: @course_mark.mark
    fill_in 'Observations', with: @course_mark.observations
    fill_in 'Student course', with: @course_mark.student_course_id
    click_on 'Update Course mark'

    assert_text 'Course mark was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Course mark' do
    visit course_marks_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Course mark was successfully destroyed'
  end
end
