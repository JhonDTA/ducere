require 'application_system_test_case'

class TutorsTest < ApplicationSystemTestCase
  setup do
    @tutor = tutors(:one)
  end

  test 'visiting the index' do
    visit tutors_url
    assert_selector 'h1', text: 'Tutors'
  end

  test 'creating a Tutor' do
    visit tutors_url
    click_on 'New Tutor'

    fill_in 'Parent', with: @tutor.parent_id
    fill_in 'Relationship', with: @tutor.relationship_id
    fill_in 'Student', with: @tutor.student_id
    click_on 'Create Tutor'

    assert_text 'Tutor was successfully created'
    click_on 'Back'
  end

  test 'updating a Tutor' do
    visit tutors_url
    click_on 'Edit', match: :first

    fill_in 'Parent', with: @tutor.parent_id
    fill_in 'Relationship', with: @tutor.relationship_id
    fill_in 'Student', with: @tutor.student_id
    click_on 'Update Tutor'

    assert_text 'Tutor was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Tutor' do
    visit tutors_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Tutor was successfully destroyed'
  end
end
