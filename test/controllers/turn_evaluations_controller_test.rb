# frozen_string_literal: true

require 'test_helper'

class TurnEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turn_evaluation = turn_evaluations(:one)
  end

  test 'should get index' do
    get turn_evaluations_url
    assert_response :success
  end

  test 'should get new' do
    get new_turn_evaluation_url
    assert_response :success
  end

  test 'should create turn_evaluation' do
    assert_difference('TurnEvaluation.count') do
      post turn_evaluations_url, params: { turn_evaluation: { cycle_turn_id: @turn_evaluation.cycle_turn_id, evaluation_period_id: @turn_evaluation.evaluation_period_id } }
    end

    assert_redirected_to turn_evaluation_url(TurnEvaluation.last)
  end

  test 'should show turn_evaluation' do
    get turn_evaluation_url(@turn_evaluation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_turn_evaluation_url(@turn_evaluation)
    assert_response :success
  end

  test 'should update turn_evaluation' do
    patch turn_evaluation_url(@turn_evaluation), params: { turn_evaluation: { cycle_turn_id: @turn_evaluation.cycle_turn_id, evaluation_period_id: @turn_evaluation.evaluation_period_id } }
    assert_redirected_to turn_evaluation_url(@turn_evaluation)
  end

  test 'should destroy turn_evaluation' do
    assert_difference('TurnEvaluation.count', -1) do
      delete turn_evaluation_url(@turn_evaluation)
    end

    assert_redirected_to turn_evaluations_url
  end
end
