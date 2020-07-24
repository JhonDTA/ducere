require 'test_helper'

class AcademicCyclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_cycle = academic_cycles(:one)
  end

  test "should get index" do
    get academic_cycles_url
    assert_response :success
  end

  test "should get new" do
    get new_academic_cycle_url
    assert_response :success
  end

  test "should create academic_cycle" do
    assert_difference('AcademicCycle.count') do
      post academic_cycles_url, params: { academic_cycle: { code: @academic_cycle.code, cycle_type_id: @academic_cycle.cycle_type_id, description: @academic_cycle.description, finish: @academic_cycle.finish, name: @academic_cycle.name, start: @academic_cycle.start, status_id: @academic_cycle.status_id } }
    end

    assert_redirected_to academic_cycle_url(AcademicCycle.last)
  end

  test "should show academic_cycle" do
    get academic_cycle_url(@academic_cycle)
    assert_response :success
  end

  test "should get edit" do
    get edit_academic_cycle_url(@academic_cycle)
    assert_response :success
  end

  test "should update academic_cycle" do
    patch academic_cycle_url(@academic_cycle), params: { academic_cycle: { code: @academic_cycle.code, cycle_type_id: @academic_cycle.cycle_type_id, description: @academic_cycle.description, finish: @academic_cycle.finish, name: @academic_cycle.name, start: @academic_cycle.start, status_id: @academic_cycle.status_id } }
    assert_redirected_to academic_cycle_url(@academic_cycle)
  end

  test "should destroy academic_cycle" do
    assert_difference('AcademicCycle.count', -1) do
      delete academic_cycle_url(@academic_cycle)
    end

    assert_redirected_to academic_cycles_url
  end
end
