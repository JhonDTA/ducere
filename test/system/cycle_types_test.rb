require 'application_system_test_case'

class CycleTypesTest < ApplicationSystemTestCase
  setup do
    @cycle_type = cycle_types(:one)
  end

  test 'visiting the index' do
    visit cycle_types_url
    assert_selector 'h1', text: 'Cycle Types'
  end

  test 'creating a Cycle type' do
    visit cycle_types_url
    click_on 'New Cycle Type'

    fill_in 'Code', with: @cycle_type.code
    fill_in 'Description', with: @cycle_type.description
    fill_in 'Duration', with: @cycle_type.duration
    fill_in 'Name', with: @cycle_type.name
    fill_in 'Status', with: @cycle_type.status_id
    click_on 'Create Cycle type'

    assert_text 'Cycle type was successfully created'
    click_on 'Back'
  end

  test 'updating a Cycle type' do
    visit cycle_types_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @cycle_type.code
    fill_in 'Description', with: @cycle_type.description
    fill_in 'Duration', with: @cycle_type.duration
    fill_in 'Name', with: @cycle_type.name
    fill_in 'Status', with: @cycle_type.status_id
    click_on 'Update Cycle type'

    assert_text 'Cycle type was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Cycle type' do
    visit cycle_types_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Cycle type was successfully destroyed'
  end
end
