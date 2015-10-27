require 'test_helper'

class TrainingsControllerTest < ActionController::TestCase
  setup do
    @training = trainings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training" do
    assert_difference('Training.count') do
      post :create, training: { dateEnd: @training.dateEnd, dateStart: @training.dateStart, description: @training.description, duration: @training.duration, muscularGroups: @training.muscularGroups, patient_id: @training.patient_id, weekDay: @training.weekDay }
    end

    assert_redirected_to training_path(assigns(:training))
  end

  test "should show training" do
    get :show, id: @training
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training
    assert_response :success
  end

  test "should update training" do
    patch :update, id: @training, training: { dateEnd: @training.dateEnd, dateStart: @training.dateStart, description: @training.description, duration: @training.duration, muscularGroups: @training.muscularGroups, patient_id: @training.patient_id, weekDay: @training.weekDay }
    assert_redirected_to training_path(assigns(:training))
  end

  test "should destroy training" do
    assert_difference('Training.count', -1) do
      delete :destroy, id: @training
    end

    assert_redirected_to trainings_path
  end
end
