# frozen_string_literal: true

require 'test_helper'

class HomeworkMarksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homework_mark = homework_marks(:one)
  end

  test 'should get index' do
    get homework_marks_url
    assert_response :success
  end

  test 'should get new' do
    get new_homework_mark_url
    assert_response :success
  end

  test 'should create homework_mark' do
    assert_difference('HomeworkMark.count') do
      post homework_marks_url, params: { homework_mark: { mark: @homework_mark.mark, observations: @homework_mark.observations, student_homework_id: @homework_mark.student_homework_id } }
    end

    assert_redirected_to homework_mark_url(HomeworkMark.last)
  end

  test 'should show homework_mark' do
    get homework_mark_url(@homework_mark)
    assert_response :success
  end

  test 'should get edit' do
    get edit_homework_mark_url(@homework_mark)
    assert_response :success
  end

  test 'should update homework_mark' do
    patch homework_mark_url(@homework_mark), params: { homework_mark: { mark: @homework_mark.mark, observations: @homework_mark.observations, student_homework_id: @homework_mark.student_homework_id } }
    assert_redirected_to homework_mark_url(@homework_mark)
  end

  test 'should destroy homework_mark' do
    assert_difference('HomeworkMark.count', -1) do
      delete homework_mark_url(@homework_mark)
    end

    assert_redirected_to homework_marks_url
  end
end
