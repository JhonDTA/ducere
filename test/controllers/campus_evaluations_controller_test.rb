require 'test_helper'

class CampusEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campus_evaluation = campus_evaluations(:one)
  end

  test "should get index" do
    get campus_evaluations_url
    assert_response :success
  end

  test "should get new" do
    get new_campus_evaluation_url
    assert_response :success
  end

  test "should create campus_evaluation" do
    assert_difference('CampusEvaluation.count') do
      post campus_evaluations_url, params: { campus_evaluation: { campus_id: @campus_evaluation.campus_id, turn_evaluation_id: @campus_evaluation.turn_evaluation_id } }
    end

    assert_redirected_to campus_evaluation_url(CampusEvaluation.last)
  end

  test "should show campus_evaluation" do
    get campus_evaluation_url(@campus_evaluation)
    assert_response :success
  end

  test "should get edit" do
    get edit_campus_evaluation_url(@campus_evaluation)
    assert_response :success
  end

  test "should update campus_evaluation" do
    patch campus_evaluation_url(@campus_evaluation), params: { campus_evaluation: { campus_id: @campus_evaluation.campus_id, turn_evaluation_id: @campus_evaluation.turn_evaluation_id } }
    assert_redirected_to campus_evaluation_url(@campus_evaluation)
  end

  test "should destroy campus_evaluation" do
    assert_difference('CampusEvaluation.count', -1) do
      delete campus_evaluation_url(@campus_evaluation)
    end

    assert_redirected_to campus_evaluations_url
  end
end
