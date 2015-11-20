require 'test_helper'

class RecentActivitiesControllerTest < ActionController::TestCase
  setup do
    @recent_activity = recent_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recent_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recent_activity" do
    assert_difference('RecentActivity.count') do
      post :create, recent_activity: { date: @recent_activity.date, description: @recent_activity.description, patient_id: @recent_activity.patient_id, user_id: @recent_activity.user_id }
    end

    assert_redirected_to recent_activity_path(assigns(:recent_activity))
  end

  test "should show recent_activity" do
    get :show, id: @recent_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recent_activity
    assert_response :success
  end

  test "should update recent_activity" do
    patch :update, id: @recent_activity, recent_activity: { date: @recent_activity.date, description: @recent_activity.description, patient_id: @recent_activity.patient_id, user_id: @recent_activity.user_id }
    assert_redirected_to recent_activity_path(assigns(:recent_activity))
  end

  test "should destroy recent_activity" do
    assert_difference('RecentActivity.count', -1) do
      delete :destroy, id: @recent_activity
    end

    assert_redirected_to recent_activities_path
  end
end
