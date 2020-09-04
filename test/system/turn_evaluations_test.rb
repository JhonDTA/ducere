# frozen_string_literal: true

require 'application_system_test_case'

class TurnEvaluationsTest < ApplicationSystemTestCase
  setup do
    @turn_evaluation = turn_evaluations(:one)
  end

  test 'visiting the index' do
    visit turn_evaluations_url
    assert_selector 'h1', text: 'Turn Evaluations'
  end

  test 'creating a Turn evaluation' do
    visit turn_evaluations_url
    click_on 'New Turn Evaluation'

    fill_in 'Cycle turn', with: @turn_evaluation.cycle_turn_id
    fill_in 'Evaluation period', with: @turn_evaluation.evaluation_period_id
    click_on 'Create Turn evaluation'

    assert_text 'Turn evaluation was successfully created'
    click_on 'Back'
  end

  test 'updating a Turn evaluation' do
    visit turn_evaluations_url
    click_on 'Edit', match: :first

    fill_in 'Cycle turn', with: @turn_evaluation.cycle_turn_id
    fill_in 'Evaluation period', with: @turn_evaluation.evaluation_period_id
    click_on 'Update Turn evaluation'

    assert_text 'Turn evaluation was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Turn evaluation' do
    visit turn_evaluations_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Turn evaluation was successfully destroyed'
  end
end
