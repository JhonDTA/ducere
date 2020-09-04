# frozen_string_literal: true

require 'application_system_test_case'

class CourseHomeworksTest < ApplicationSystemTestCase
  setup do
    @course_homework = course_homeworks(:one)
  end

  test 'visiting the index' do
    visit course_homeworks_url
    assert_selector 'h1', text: 'Course Homeworks'
  end

  test 'creating a Course homework' do
    visit course_homeworks_url
    click_on 'New Course Homework'

    fill_in 'Course evaluation', with: @course_homework.course_evaluation_id
    fill_in 'Description', with: @course_homework.description
    fill_in 'Name', with: @course_homework.name
    click_on 'Create Course homework'

    assert_text 'Course homework was successfully created'
    click_on 'Back'
  end

  test 'updating a Course homework' do
    visit course_homeworks_url
    click_on 'Edit', match: :first

    fill_in 'Course evaluation', with: @course_homework.course_evaluation_id
    fill_in 'Description', with: @course_homework.description
    fill_in 'Name', with: @course_homework.name
    click_on 'Update Course homework'

    assert_text 'Course homework was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Course homework' do
    visit course_homeworks_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Course homework was successfully destroyed'
  end
end
