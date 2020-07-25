require "application_system_test_case"

class CycleTurnsTest < ApplicationSystemTestCase
  setup do
    @cycle_turn = cycle_turns(:one)
  end

  test "visiting the index" do
    visit cycle_turns_url
    assert_selector "h1", text: "Cycle Turns"
  end

  test "creating a Cycle turn" do
    visit cycle_turns_url
    click_on "New Cycle Turn"

    fill_in "Cycle modality", with: @cycle_turn.cycle_modality_id
    fill_in "Turn", with: @cycle_turn.turn_id
    click_on "Create Cycle turn"

    assert_text "Cycle turn was successfully created"
    click_on "Back"
  end

  test "updating a Cycle turn" do
    visit cycle_turns_url
    click_on "Edit", match: :first

    fill_in "Cycle modality", with: @cycle_turn.cycle_modality_id
    fill_in "Turn", with: @cycle_turn.turn_id
    click_on "Update Cycle turn"

    assert_text "Cycle turn was successfully updated"
    click_on "Back"
  end

  test "destroying a Cycle turn" do
    visit cycle_turns_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cycle turn was successfully destroyed"
  end
end
