# frozen_string_literal: true

require 'application_system_test_case'

class CourseEvaluationsTest < ApplicationSystemTestCase
  setup do
    @course_evaluation = course_evaluations(:one)
  end

  test 'visiting the index' do
    visit course_evaluations_url
    assert_selector 'h1', text: 'Course Evaluations'
  end

  test 'creating a Course evaluation' do
    visit course_evaluations_url
    click_on 'New Course Evaluation'

    fill_in 'Campus evaluation', with: @course_evaluation.campus_evaluation_id
    fill_in 'Grade course', with: @course_evaluation.grade_course_id
    fill_in 'Group', with: @course_evaluation.group_id
    fill_in 'Professor', with: @course_evaluation.professor_id
    click_on 'Create Course evaluation'

    assert_text 'Course evaluation was successfully created'
    click_on 'Back'
  end

  test 'updating a Course evaluation' do
    visit course_evaluations_url
    click_on 'Edit', match: :first

    fill_in 'Campus evaluation', with: @course_evaluation.campus_evaluation_id
    fill_in 'Grade course', with: @course_evaluation.grade_course_id
    fill_in 'Group', with: @course_evaluation.group_id
    fill_in 'Professor', with: @course_evaluation.professor_id
    click_on 'Update Course evaluation'

    assert_text 'Course evaluation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Course evaluation' do
    visit course_evaluations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Course evaluation was successfully destroyed'
  end
end
