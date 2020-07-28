require 'application_system_test_case'

class StudentCoursesTest < ApplicationSystemTestCase
  setup do
    @student_course = student_courses(:one)
  end

  test 'visiting the index' do
    visit student_courses_url
    assert_selector 'h1', text: 'Student Courses'
  end

  test 'creating a Student course' do
    visit student_courses_url
    click_on 'New Student Course'

    fill_in 'Attendance', with: @student_course.attendance
    fill_in 'Course evaluation', with: @student_course.course_evaluation_id
    fill_in 'Mark', with: @student_course.mark
    fill_in 'Observations', with: @student_course.observations
    fill_in 'Student', with: @student_course.student_id
    click_on 'Create Student course'

    assert_text 'Student course was successfully created'
    click_on 'Back'
  end

  test 'updating a Student course' do
    visit student_courses_url
    click_on 'Edit', match: :first

    fill_in 'Attendance', with: @student_course.attendance
    fill_in 'Course evaluation', with: @student_course.course_evaluation_id
    fill_in 'Mark', with: @student_course.mark
    fill_in 'Observations', with: @student_course.observations
    fill_in 'Student', with: @student_course.student_id
    click_on 'Update Student course'

    assert_text 'Student course was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Student course' do
    visit student_courses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Student course was successfully destroyed'
  end
end
