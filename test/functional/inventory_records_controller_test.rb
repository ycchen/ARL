require 'test_helper'

class InventoryRecordsControllerTest < ActionController::TestCase
  setup do
    @inventory_record = inventory_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_record" do
    assert_difference('InventoryRecord.count') do
      post :create, inventory_record: { latitude: @inventory_record.latitude, longitude: @inventory_record.longitude }
    end

    assert_redirected_to inventory_record_path(assigns(:inventory_record))
  end

  test "should show inventory_record" do
    get :show, id: @inventory_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_record
    assert_response :success
  end

  test "should update inventory_record" do
    put :update, id: @inventory_record, inventory_record: { latitude: @inventory_record.latitude, longitude: @inventory_record.longitude }
    assert_redirected_to inventory_record_path(assigns(:inventory_record))
  end

  test "should destroy inventory_record" do
    assert_difference('InventoryRecord.count', -1) do
      delete :destroy, id: @inventory_record
    end

    assert_redirected_to inventory_records_path
  end
end
