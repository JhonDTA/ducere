require 'application_system_test_case'

class HomeworkMarksTest < ApplicationSystemTestCase
  setup do
    @homework_mark = homework_marks(:one)
  end

  test 'visiting the index' do
    visit homework_marks_url
    assert_selector 'h1', text: 'Homework Marks'
  end

  test 'creating a Homework mark' do
    visit homework_marks_url
    click_on 'New Homework Mark'

    fill_in 'Mark', with: @homework_mark.mark
    fill_in 'Observations', with: @homework_mark.observations
    fill_in 'Student homework', with: @homework_mark.student_homework_id
    click_on 'Create Homework mark'

    assert_text 'Homework mark was successfully created'
    click_on 'Back'
  end

  test 'updating a Homework mark' do
    visit homework_marks_url
    click_on 'Edit', match: :first

    fill_in 'Mark', with: @homework_mark.mark
    fill_in 'Observations', with: @homework_mark.observations
    fill_in 'Student homework', with: @homework_mark.student_homework_id
    click_on 'Update Homework mark'

    assert_text 'Homework mark was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Homework mark' do
    visit homework_marks_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Homework mark was successfully destroyed'
  end
end
