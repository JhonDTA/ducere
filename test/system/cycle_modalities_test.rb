require 'application_system_test_case'

class CycleModalitiesTest < ApplicationSystemTestCase
  setup do
    @cycle_modality = cycle_modalities(:one)
  end

  test 'visiting the index' do
    visit cycle_modalities_url
    assert_selector 'h1', text: 'Cycle Modalities'
  end

  test 'creating a Cycle modality' do
    visit cycle_modalities_url
    click_on 'New Cycle Modality'

    fill_in 'Academic cycle', with: @cycle_modality.academic_cycle_id
    fill_in 'Modality', with: @cycle_modality.modality_id
    click_on 'Create Cycle modality'

    assert_text 'Cycle modality was successfully created'
    click_on 'Back'
  end

  test 'updating a Cycle modality' do
    visit cycle_modalities_url
    click_on 'Edit', match: :first

    fill_in 'Academic cycle', with: @cycle_modality.academic_cycle_id
    fill_in 'Modality', with: @cycle_modality.modality_id
    click_on 'Update Cycle modality'

    assert_text 'Cycle modality was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Cycle modality' do
    visit cycle_modalities_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Cycle modality was successfully destroyed'
  end
end
