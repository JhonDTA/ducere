require 'test_helper'

class CareerSyllabusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @career_syllabus = career_syllabuses(:one)
  end

  test "should get index" do
    get career_syllabuses_url
    assert_response :success
  end

  test "should get new" do
    get new_career_syllabus_url
    assert_response :success
  end

  test "should create career_syllabus" do
    assert_difference('CareerSyllabus.count') do
      post career_syllabuses_url, params: { career_syllabus: { level_career_id: @career_syllabus.level_career_id, syllabus_id: @career_syllabus.syllabus_id } }
    end

    assert_redirected_to career_syllabus_url(CareerSyllabus.last)
  end

  test "should show career_syllabus" do
    get career_syllabus_url(@career_syllabus)
    assert_response :success
  end

  test "should get edit" do
    get edit_career_syllabus_url(@career_syllabus)
    assert_response :success
  end

  test "should update career_syllabus" do
    patch career_syllabus_url(@career_syllabus), params: { career_syllabus: { level_career_id: @career_syllabus.level_career_id, syllabus_id: @career_syllabus.syllabus_id } }
    assert_redirected_to career_syllabus_url(@career_syllabus)
  end

  test "should destroy career_syllabus" do
    assert_difference('CareerSyllabus.count', -1) do
      delete career_syllabus_url(@career_syllabus)
    end

    assert_redirected_to career_syllabuses_url
  end
end
