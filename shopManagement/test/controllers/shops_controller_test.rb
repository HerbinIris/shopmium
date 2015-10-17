require 'test_helper'

class ShopsControllerTest < ActionController::TestCase
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shop" do
    assert_difference('Shop.count') do
      post :create, shop: { address: @shop.address, chain: @shop.chain, city: @shop.city, country_code: @shop.country_code, department: @shop.department, hour: @shop.hour, ignore_reason: @shop.ignore_reason, ignored: @shop.ignored, is_address_computed: @shop.is_address_computed, is_location_computed: @shop.is_location_computed, key: @shop.key, latitude: @shop.latitude, longitude: @shop.longitude, mandatory_coords: @shop.mandatory_coords, name: @shop.name, overload_chain_name: @shop.overload_chain_name, phone: @shop.phone, store_id: @shop.store_id, zip: @shop.zip }
    end

    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should show shop" do
    get :show, id: @shop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shop
    assert_response :success
  end

  test "should update shop" do
    patch :update, id: @shop, shop: { address: @shop.address, chain: @shop.chain, city: @shop.city, country_code: @shop.country_code, department: @shop.department, hour: @shop.hour, ignore_reason: @shop.ignore_reason, ignored: @shop.ignored, is_address_computed: @shop.is_address_computed, is_location_computed: @shop.is_location_computed, key: @shop.key, latitude: @shop.latitude, longitude: @shop.longitude, mandatory_coords: @shop.mandatory_coords, name: @shop.name, overload_chain_name: @shop.overload_chain_name, phone: @shop.phone, store_id: @shop.store_id, zip: @shop.zip }
    assert_redirected_to shop_path(assigns(:shop))
  end

  test "should destroy shop" do
    assert_difference('Shop.count', -1) do
      delete :destroy, id: @shop
    end

    assert_redirected_to shops_path
  end
end
