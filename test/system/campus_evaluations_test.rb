# frozen_string_literal: true

require 'application_system_test_case'

class CampusEvaluationsTest < ApplicationSystemTestCase
  setup do
    @campus_evaluation = campus_evaluations(:one)
  end

  test 'visiting the index' do
    visit campus_evaluations_url
    assert_selector 'h1', text: 'Campus Evaluations'
  end

  test 'creating a Campus evaluation' do
    visit campus_evaluations_url
    click_on 'New Campus Evaluation'

    fill_in 'Campus', with: @campus_evaluation.campus_id
    fill_in 'Turn evaluation', with: @campus_evaluation.turn_evaluation_id
    click_on 'Create Campus evaluation'

    assert_text 'Campus evaluation was successfully created'
    click_on 'Back'
  end

  test 'updating a Campus evaluation' do
    visit campus_evaluations_url
    click_on 'Edit', match: :first

    fill_in 'Campus', with: @campus_evaluation.campus_id
    fill_in 'Turn evaluation', with: @campus_evaluation.turn_evaluation_id
    click_on 'Update Campus evaluation'

    assert_text 'Campus evaluation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Campus evaluation' do
    visit campus_evaluations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Campus evaluation was successfully destroyed'
  end
end
