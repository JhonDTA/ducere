require 'application_system_test_case'

class EducativeLevelsTest < ApplicationSystemTestCase
  setup do
    @educative_level = educative_levels(:one)
  end

  test 'visiting the index' do
    visit educative_levels_url
    assert_selector 'h1', text: 'Educative Levels'
  end

  test 'creating a Educative level' do
    visit educative_levels_url
    click_on 'New Educative Level'

    fill_in 'Code', with: @educative_level.code
    fill_in 'Description', with: @educative_level.description
    fill_in 'Name', with: @educative_level.name
    fill_in 'Status', with: @educative_level.status_id
    click_on 'Create Educative level'

    assert_text 'Educative level was successfully created'
    click_on 'Back'
  end

  test 'updating a Educative level' do
    visit educative_levels_url
    click_on 'Edit', match: :first

    fill_in 'Code', with: @educative_level.code
    fill_in 'Description', with: @educative_level.description
    fill_in 'Name', with: @educative_level.name
    fill_in 'Status', with: @educative_level.status_id
    click_on 'Update Educative level'

    assert_text 'Educative level was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Educative level' do
    visit educative_levels_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Educative level was successfully destroyed'
  end
end
