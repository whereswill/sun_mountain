require 'test_helper'

class DeliveriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @base_title = ENV["COMPANY_NAME"]
    @delivery = deliveries(:one)
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get index" do
    log_in_as(@user)
    get deliveries_url
    assert_response :success
  end

  test "should redirect index when not logged in" do
    get deliveries_url
    assert_redirected_to login_url
  end

  test "should get new" do
    log_in_as(@user)
    get new_delivery_url
    assert_response :success
  end

  test "should create delivery" do
    log_in_as(@user)
    assert_difference('Delivery.count') do
      post deliveries_url, params: { delivery: { address1: @delivery.address1, address2: @delivery.address2, city: @delivery.city, notes: @delivery.notes, state: @delivery.state, zip_code: @delivery.zip_code } }
    end

    assert_redirected_to delivery_url(Delivery.last)
  end

  test "should redirect create delivery when not logged in" do
    assert_no_difference 'Delivery.count' do
      post deliveries_url, params: { delivery: { address1: @delivery.address1, address2: @delivery.address2, city: @delivery.city, notes: @delivery.notes, state: @delivery.state, zip_code: @delivery.zip_code } }
    end

    assert_redirected_to login_url
  end

  test "should show delivery" do
    log_in_as(@user)
    get delivery_url(@delivery)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_delivery_url(@delivery)
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_delivery_url(@delivery)
    assert_redirected_to login_url
  end

  test "should update delivery" do
    log_in_as(@user)
    patch delivery_url(@delivery), params: { delivery: { address1: @delivery.address1, address2: @delivery.address2, city: @delivery.city, notes: @delivery.notes, state: @delivery.state, zip_code: @delivery.zip_code } }
    assert_redirected_to delivery_url(@delivery)
  end

  test "should redirect delivery when not logged in" do
    patch delivery_url(@delivery), params: { delivery: { address1: @delivery.address1, address2: @delivery.address2, city: @delivery.city, notes: @delivery.notes, state: @delivery.state, zip_code: @delivery.zip_code } }
    assert_redirected_to login_url
  end

  test "should destroy delivery" do
    log_in_as(@user)
    assert_difference('Delivery.count', -1) do
      delete delivery_url(@delivery)
    end

    assert_redirected_to deliveries_url
  end

  test "should not destroy delivery for non-admin" do
    log_in_as(@other_user)
    assert_no_difference 'Delivery.count' do
      delete delivery_url(@delivery)
    end

    assert_redirected_to root_url
  end
end
