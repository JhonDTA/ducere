# frozen_string_literal: true

require 'test_helper'

class CycleTurnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cycle_turn = cycle_turns(:one)
  end

  test 'should get index' do
    get cycle_turns_url
    assert_response :success
  end

  test 'should get new' do
    get new_cycle_turn_url
    assert_response :success
  end

  test 'should create cycle_turn' do
    assert_difference('CycleTurn.count') do
      post cycle_turns_url, params: { cycle_turn: { cycle_modality_id: @cycle_turn.cycle_modality_id, turn_id: @cycle_turn.turn_id } }
    end

    assert_redirected_to cycle_turn_url(CycleTurn.last)
  end

  test 'should show cycle_turn' do
    get cycle_turn_url(@cycle_turn)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cycle_turn_url(@cycle_turn)
    assert_response :success
  end

  test 'should update cycle_turn' do
    patch cycle_turn_url(@cycle_turn), params: { cycle_turn: { cycle_modality_id: @cycle_turn.cycle_modality_id, turn_id: @cycle_turn.turn_id } }
    assert_redirected_to cycle_turn_url(@cycle_turn)
  end

  test 'should destroy cycle_turn' do
    assert_difference('CycleTurn.count', -1) do
      delete cycle_turn_url(@cycle_turn)
    end

    assert_redirected_to cycle_turns_url
  end
end
