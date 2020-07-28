require 'application_system_test_case'

class ProfessorCoursesTest < ApplicationSystemTestCase
  setup do
    @professor_course = professor_courses(:one)
  end

  test 'visiting the index' do
    visit professor_courses_url
    assert_selector 'h1', text: 'Professor Courses'
  end

  test 'creating a Professor course' do
    visit professor_courses_url
    click_on 'New Professor Course'

    fill_in 'Course', with: @professor_course.course_id
    fill_in 'Professor', with: @professor_course.professor_id
    click_on 'Create Professor course'

    assert_text 'Professor course was successfully created'
    click_on 'Back'
  end

  test 'updating a Professor course' do
    visit professor_courses_url
    click_on 'Edit', match: :first

    fill_in 'Course', with: @professor_course.course_id
    fill_in 'Professor', with: @professor_course.professor_id
    click_on 'Update Professor course'

    assert_text 'Professor course was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Professor course' do
    visit professor_courses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Professor course was successfully destroyed'
  end
end
