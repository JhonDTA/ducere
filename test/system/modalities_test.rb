# frozen_string_literal: true

require 'application_system_test_case'

class ModalitiesTest < ApplicationSystemTestCase
  setup do
    @modality = modalities(:one)
  end

  test 'visiting the index' do
    visit modalities_url
    assert_selector 'h1', text: 'Modalities'
  end

  test 'creating a Modality' do
    visit modalities_url
    click_on 'New Modality'

    fill_in 'Code', with: @modality.code
    fill_in 'Description', with: @modality.description
    fill_in 'Name', with: @modality.name
    fill_in 'Status', with: @modality.status_id
    click_on 'Create Modality'

    assert_text 'Modality was successfully created'
    click_on 'Back'
  end

  test 'updating a Modality' do
    visit modalities_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @modality.code
    fill_in 'Description', with: @modality.description
    fill_in 'Name', with: @modality.name
    fill_in 'Status', with: @modality.status_id
    click_on 'Update Modality'

    assert_text 'Modality was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Modality' do
    visit modalities_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Modality was successfully destroyed'
  end
end
