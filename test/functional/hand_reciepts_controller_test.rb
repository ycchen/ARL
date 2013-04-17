require 'test_helper'

class HandRecieptsControllerTest < ActionController::TestCase
  setup do
    @hand_reciept = hand_reciepts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hand_reciepts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hand_reciept" do
    assert_difference('HandReciept.count') do
      post :create, hand_reciept: { reciept: @hand_reciept.reciept }
    end

    assert_redirected_to hand_reciept_path(assigns(:hand_reciept))
  end

  test "should show hand_reciept" do
    get :show, id: @hand_reciept
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hand_reciept
    assert_response :success
  end

  test "should update hand_reciept" do
    put :update, id: @hand_reciept, hand_reciept: { reciept: @hand_reciept.reciept }
    assert_redirected_to hand_reciept_path(assigns(:hand_reciept))
  end

  test "should destroy hand_reciept" do
    assert_difference('HandReciept.count', -1) do
      delete :destroy, id: @hand_reciept
    end

    assert_redirected_to hand_reciepts_path
  end
end
