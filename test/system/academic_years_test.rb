# frozen_string_literal: true

require 'application_system_test_case'

class AcademicYearsTest < ApplicationSystemTestCase
  setup do
    @academic_year = academic_years(:one)
  end

  test 'visiting the index' do
    visit academic_years_url
    assert_selector 'h1', text: 'Academic Years'
  end

  test 'creating a Academic year' do
    visit academic_years_url
    click_on 'New Academic Year'

    fill_in 'Campu', with: @academic_year.campu_id
    fill_in 'Finish', with: @academic_year.finish
    fill_in 'Start', with: @academic_year.start
    click_on 'Create Academic year'

    assert_text 'Academic year was successfully created'
    click_on 'Back'
  end

  test 'updating a Academic year' do
    visit academic_years_url
    click_on 'Edit', match: :first

    fill_in 'Campu', with: @academic_year.campu_id
    fill_in 'Finish', with: @academic_year.finish
    fill_in 'Start', with: @academic_year.start
    click_on 'Update Academic year'

    assert_text 'Academic year was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Academic year' do
    visit academic_years_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Academic year was successfully destroyed'
  end
end
