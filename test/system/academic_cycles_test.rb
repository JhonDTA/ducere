require 'application_system_test_case'

class AcademicCyclesTest < ApplicationSystemTestCase
  setup do
    @academic_cycle = academic_cycles(:one)
  end

  test 'visiting the index' do
    visit academic_cycles_url
    assert_selector 'h1', text: 'Academic Cycles'
  end

  test 'creating a Academic cycle' do
    visit academic_cycles_url
    click_on 'New Academic Cycle'

    fill_in 'Code', with: @academic_cycle.code
    fill_in 'Cycle type', with: @academic_cycle.cycle_type_id
    fill_in 'Description', with: @academic_cycle.description
    fill_in 'Finish', with: @academic_cycle.finish
    fill_in 'Name', with: @academic_cycle.name
    fill_in 'Start', with: @academic_cycle.start
    fill_in 'Status', with: @academic_cycle.status_id
    click_on 'Create Academic cycle'

    assert_text 'Academic cycle was successfully created'
    click_on 'Back'
  end

  test 'updating a Academic cycle' do
    visit academic_cycles_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @academic_cycle.code
    fill_in 'Cycle type', with: @academic_cycle.cycle_type_id
    fill_in 'Description', with: @academic_cycle.description
    fill_in 'Finish', with: @academic_cycle.finish
    fill_in 'Name', with: @academic_cycle.name
    fill_in 'Start', with: @academic_cycle.start
    fill_in 'Status', with: @academic_cycle.status_id
    click_on 'Update Academic cycle'

    assert_text 'Academic cycle was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Academic cycle' do
    visit academic_cycles_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Academic cycle was successfully destroyed'
  end
end
