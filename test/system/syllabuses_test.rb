require 'application_system_test_case'

class SyllabusesTest < ApplicationSystemTestCase
  setup do
    @syllabus = syllabuses(:one)
  end

  test 'visiting the index' do
    visit syllabuses_url
    assert_selector 'h1', text: 'Syllabuses'
  end

  test 'creating a Syllabus' do
    visit syllabuses_url
    click_on 'New Syllabus'

    fill_in 'Approval credits', with: @syllabus.approval_credits
    fill_in 'Career', with: @syllabus.career_id
    fill_in 'Code', with: @syllabus.code
    fill_in 'Description', with: @syllabus.description
    fill_in 'Name', with: @syllabus.name
    fill_in 'Status', with: @syllabus.status_id
    click_on 'Create Syllabus'

    assert_text 'Syllabus was successfully created'
    click_on 'Back'
  end

  test 'updating a Syllabus' do
    visit syllabuses_url
    click_on 'Edit', match: :first

    fill_in 'Approval credits', with: @syllabus.approval_credits
    fill_in 'Career', with: @syllabus.career_id
    fill_in 'Code', with: @syllabus.code
    fill_in 'Description', with: @syllabus.description
    fill_in 'Name', with: @syllabus.name
    fill_in 'Status', with: @syllabus.status_id
    click_on 'Update Syllabus'

    assert_text 'Syllabus was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Syllabus' do
    visit syllabuses_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Syllabus was successfully destroyed'
  end
end
