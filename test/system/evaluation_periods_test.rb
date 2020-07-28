require 'application_system_test_case'

class EvaluationPeriodsTest < ApplicationSystemTestCase
  setup do
    @evaluation_period = evaluation_periods(:one)
  end

  test 'visiting the index' do
    visit evaluation_periods_url
    assert_selector 'h1', text: 'Evaluation Periods'
  end

  test 'creating a Evaluation period' do
    visit evaluation_periods_url
    click_on 'New Evaluation Period'

    fill_in 'Code', with: @evaluation_period.code
    fill_in 'Description', with: @evaluation_period.description
    fill_in 'Name', with: @evaluation_period.name
    fill_in 'Status', with: @evaluation_period.status_id
    click_on 'Create Evaluation period'

    assert_text 'Evaluation period was successfully created'
    click_on 'Back'
  end

  test 'updating a Evaluation period' do
    visit evaluation_periods_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @evaluation_period.code
    fill_in 'Description', with: @evaluation_period.description
    fill_in 'Name', with: @evaluation_period.name
    fill_in 'Status', with: @evaluation_period.status_id
    click_on 'Update Evaluation period'

    assert_text 'Evaluation period was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Evaluation period' do
    visit evaluation_periods_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Evaluation period was successfully destroyed'
  end
end
