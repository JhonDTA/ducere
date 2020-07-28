require 'application_system_test_case'

class LevelCareersTest < ApplicationSystemTestCase
  setup do
    @level_career = level_careers(:one)
  end

  test 'visiting the index' do
    visit level_careers_url
    assert_selector 'h1', text: 'Level Careers'
  end

  test 'creating a Level career' do
    visit level_careers_url
    click_on 'New Level Career'

    fill_in 'Career', with: @level_career.career_id
    fill_in 'Educative level', with: @level_career.educative_level_id
    click_on 'Create Level career'

    assert_text 'Level career was successfully created'
    click_on 'Back'
  end

  test 'updating a Level career' do
    visit level_careers_url
    click_on 'Edit', match: :first

    fill_in 'Career', with: @level_career.career_id
    fill_in 'Educative level', with: @level_career.educative_level_id
    click_on 'Update Level career'

    assert_text 'Level career was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Level career' do
    visit level_careers_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Level career was successfully destroyed'
  end
end
