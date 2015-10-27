require 'test_helper'

class CompromisesControllerTest < ActionController::TestCase
  setup do
    @compromise = compromises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compromises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compromise" do
    assert_difference('Compromise.count') do
      post :create, compromise: { date: @compromise.date, description: @compromise.description, schedule: @compromise.schedule, title: @compromise.title, user_id: @compromise.user_id }
    end

    assert_redirected_to compromise_path(assigns(:compromise))
  end

  test "should show compromise" do
    get :show, id: @compromise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compromise
    assert_response :success
  end

  test "should update compromise" do
    patch :update, id: @compromise, compromise: { date: @compromise.date, description: @compromise.description, schedule: @compromise.schedule, title: @compromise.title, user_id: @compromise.user_id }
    assert_redirected_to compromise_path(assigns(:compromise))
  end

  test "should destroy compromise" do
    assert_difference('Compromise.count', -1) do
      delete :destroy, id: @compromise
    end

    assert_redirected_to compromises_path
  end
end
