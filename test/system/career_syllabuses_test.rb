require 'application_system_test_case'

class CareerSyllabusesTest < ApplicationSystemTestCase
  setup do
    @career_syllabus = career_syllabuses(:one)
  end

  test 'visiting the index' do
    visit career_syllabuses_url
    assert_selector 'h1', text: 'Career Syllabuses'
  end

  test 'creating a Career syllabus' do
    visit career_syllabuses_url
    click_on 'New Career Syllabus'

    fill_in 'Level career', with: @career_syllabus.level_career_id
    fill_in 'Syllabus', with: @career_syllabus.syllabus_id
    click_on 'Create Career syllabus'

    assert_text 'Career syllabus was successfully created'
    click_on 'Back'
  end

  test 'updating a Career syllabus' do
    visit career_syllabuses_url
    click_on 'Edit', match: :first

    fill_in 'Level career', with: @career_syllabus.level_career_id
    fill_in 'Syllabus', with: @career_syllabus.syllabus_id
    click_on 'Update Career syllabus'

    assert_text 'Career syllabus was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Career syllabus' do
    visit career_syllabuses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Career syllabus was successfully destroyed'
  end
end
