# frozen_string_literal: true

require 'application_system_test_case'

class TurnsTest < ApplicationSystemTestCase
  setup do
    @turn = turns(:one)
  end

  test 'visiting the index' do
    visit turns_url
    assert_selector 'h1', text: 'Turns'
  end

  test 'creating a Turn' do
    visit turns_url
    click_on 'New Turn'

    fill_in 'Code', with: @turn.code
    fill_in 'Description', with: @turn.description
    fill_in 'Finish', with: @turn.finish
    fill_in 'Name', with: @turn.name
    fill_in 'Start', with: @turn.start
    fill_in 'Status', with: @turn.status_id
    click_on 'Create Turn'

    assert_text 'Turn was successfully created'
    click_on 'Back'
  end

  test 'updating a Turn' do
    visit turns_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @turn.code
    fill_in 'Description', with: @turn.description
    fill_in 'Finish', with: @turn.finish
    fill_in 'Name', with: @turn.name
    fill_in 'Start', with: @turn.start
    fill_in 'Status', with: @turn.status_id
    click_on 'Update Turn'

    assert_text 'Turn was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Turn' do
    visit turns_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Turn was successfully destroyed'
  end
end
