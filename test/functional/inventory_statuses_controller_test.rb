require 'test_helper'

class InventoryStatusesControllerTest < ActionController::TestCase
  setup do
    @inventory_status = inventory_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_status" do
    assert_difference('InventoryStatus.count') do
      post :create, inventory_status: { name: @inventory_status.name }
    end

    assert_redirected_to inventory_status_path(assigns(:inventory_status))
  end

  test "should show inventory_status" do
    get :show, id: @inventory_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_status
    assert_response :success
  end

  test "should update inventory_status" do
    put :update, id: @inventory_status, inventory_status: { name: @inventory_status.name }
    assert_redirected_to inventory_status_path(assigns(:inventory_status))
  end

  test "should destroy inventory_status" do
    assert_difference('InventoryStatus.count', -1) do
      delete :destroy, id: @inventory_status
    end

    assert_redirected_to inventory_statuses_path
  end
end
