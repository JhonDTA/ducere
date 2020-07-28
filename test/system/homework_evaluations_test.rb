require 'application_system_test_case'

class HomeworkEvaluationsTest < ApplicationSystemTestCase
  setup do
    @homework_evaluation = homework_evaluations(:one)
  end

  test 'visiting the index' do
    visit homework_evaluations_url
    assert_selector 'h1', text: 'Homework Evaluations'
  end

  test 'creating a Homework evaluation' do
    visit homework_evaluations_url
    click_on 'New Homework Evaluation'

    fill_in 'Mark', with: @homework_evaluation.mark
    fill_in 'Observations', with: @homework_evaluation.observations
    fill_in 'Student homework', with: @homework_evaluation.student_homework_id
    click_on 'Create Homework evaluation'

    assert_text 'Homework evaluation was successfully created'
    click_on 'Back'
  end

  test 'updating a Homework evaluation' do
    visit homework_evaluations_url
    click_on 'Edit', match: :first

    fill_in 'Mark', with: @homework_evaluation.mark
    fill_in 'Observations', with: @homework_evaluation.observations
    fill_in 'Student homework', with: @homework_evaluation.student_homework_id
    click_on 'Update Homework evaluation'

    assert_text 'Homework evaluation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Homework evaluation' do
    visit homework_evaluations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Homework evaluation was successfully destroyed'
  end
end
