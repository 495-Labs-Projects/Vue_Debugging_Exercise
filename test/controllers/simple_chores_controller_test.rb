require 'test_helper'

class SimpleChoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @simple_chore = simple_chores(:one)
  end

  test "should get index" do
    get simple_chores_url
    assert_response :success
  end

  test "should get new" do
    get new_simple_chore_url
    assert_response :success
  end

  test "should create simple_chore" do
    assert_difference('SimpleChore.count') do
      post simple_chores_url, params: { simple_chore: { completed: @simple_chore.completed, name: @simple_chore.name } }
    end

    assert_redirected_to simple_chore_url(SimpleChore.last)
  end

  test "should show simple_chore" do
    get simple_chore_url(@simple_chore)
    assert_response :success
  end

  test "should get edit" do
    get edit_simple_chore_url(@simple_chore)
    assert_response :success
  end

  test "should update simple_chore" do
    patch simple_chore_url(@simple_chore), params: { simple_chore: { completed: @simple_chore.completed, name: @simple_chore.name } }
    assert_redirected_to simple_chore_url(@simple_chore)
  end

  test "should destroy simple_chore" do
    assert_difference('SimpleChore.count', -1) do
      delete simple_chore_url(@simple_chore)
    end

    assert_redirected_to simple_chores_url
  end
end
