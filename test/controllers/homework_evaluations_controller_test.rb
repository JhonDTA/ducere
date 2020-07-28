require 'test_helper'

class HomeworkEvaluationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homework_evaluation = homework_evaluations(:one)
  end

  test 'should get index' do
    get homework_evaluations_url
    assert_response :success
  end

  test 'should get new' do
    get new_homework_evaluation_url
    assert_response :success
  end

  test 'should create homework_evaluation' do
    assert_difference('HomeworkEvaluation.count') do
      post homework_evaluations_url, params: { homework_evaluation: { mark: @homework_evaluation.mark, observations: @homework_evaluation.observations, student_homework_id: @homework_evaluation.student_homework_id } }
    end

    assert_redirected_to homework_evaluation_url(HomeworkEvaluation.last)
  end

  test 'should show homework_evaluation' do
    get homework_evaluation_url(@homework_evaluation)
    assert_response :success
  end

  test 'should get edit' do
    get edit_homework_evaluation_url(@homework_evaluation)
    assert_response :success
  end

  test 'should update homework_evaluation' do
    patch homework_evaluation_url(@homework_evaluation), params: { homework_evaluation: { mark: @homework_evaluation.mark, observations: @homework_evaluation.observations, student_homework_id: @homework_evaluation.student_homework_id } }
    assert_redirected_to homework_evaluation_url(@homework_evaluation)
  end

  test 'should destroy homework_evaluation' do
    assert_difference('HomeworkEvaluation.count', -1) do
      delete homework_evaluation_url(@homework_evaluation)
    end

    assert_redirected_to homework_evaluations_url
  end
end
