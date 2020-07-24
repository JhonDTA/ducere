require 'test_helper'

class CareersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @career = careers(:one)
  end

  test "should get index" do
    get careers_url
    assert_response :success
  end

  test "should get new" do
    get new_career_url
    assert_response :success
  end

  test "should create career" do
    assert_difference('Career.count') do
      post careers_url, params: { career: { code: @career.code, description: @career.description, name: @career.name, status_id: @career.status_id } }
    end

    assert_redirected_to career_url(Career.last)
  end

  test "should show career" do
    get career_url(@career)
    assert_response :success
  end

  test "should get edit" do
    get edit_career_url(@career)
    assert_response :success
  end

  test "should update career" do
    patch career_url(@career), params: { career: { code: @career.code, description: @career.description, name: @career.name, status_id: @career.status_id } }
    assert_redirected_to career_url(@career)
  end

  test "should destroy career" do
    assert_difference('Career.count', -1) do
      delete career_url(@career)
    end

    assert_redirected_to careers_url
  end
end
