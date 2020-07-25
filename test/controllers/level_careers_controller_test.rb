require 'test_helper'

class LevelCareersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @level_career = level_careers(:one)
  end

  test "should get index" do
    get level_careers_url
    assert_response :success
  end

  test "should get new" do
    get new_level_career_url
    assert_response :success
  end

  test "should create level_career" do
    assert_difference('LevelCareer.count') do
      post level_careers_url, params: { level_career: { career_id: @level_career.career_id, educative_level_id: @level_career.educative_level_id } }
    end

    assert_redirected_to level_career_url(LevelCareer.last)
  end

  test "should show level_career" do
    get level_career_url(@level_career)
    assert_response :success
  end

  test "should get edit" do
    get edit_level_career_url(@level_career)
    assert_response :success
  end

  test "should update level_career" do
    patch level_career_url(@level_career), params: { level_career: { career_id: @level_career.career_id, educative_level_id: @level_career.educative_level_id } }
    assert_redirected_to level_career_url(@level_career)
  end

  test "should destroy level_career" do
    assert_difference('LevelCareer.count', -1) do
      delete level_career_url(@level_career)
    end

    assert_redirected_to level_careers_url
  end
end
