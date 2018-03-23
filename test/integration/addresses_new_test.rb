require 'test_helper'

class AddressesNewTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @address = addresses(:one)
    @user = users(:michael)
  end

  test "only logged in user can add address" do
    get new_account_address_path(@account)
    assert_redirected_to login_url
  end

  test "invalid address information" do
    log_in_as(@user)
    get new_account_address_path(@account)
    assert_no_difference 'Address.count' do
      post account_addresses_path(id: @account.id,
                              account_id: @account.id,
                               address: { address_type: "mailing",
                                          address1: "",
                                          city: ""})
    end
    assert_template 'addresses/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "adding address of same type fails" do
    log_in_as(@user)
    get new_account_address_path(@account)
    assert_no_difference 'Address.count' do
      post account_addresses_path(id: @account.id,
                              account_id: @account.id,
                               address: { address_type: "delivery",
                                          address1: "655 Fake Road",
                                          city: "New York",
                                          state: "NY",
                                          zip_code: "97702"})
    end
    assert_template 'addresses/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid address information successful" do
    log_in_as(@user)
    get new_account_address_path(@account)
    assert_difference 'Address.count', 1 do
      post account_addresses_path(id: @account.id,
                              account_id: @account.id,
                               address: { address_type: "mailing",
                                          address1: "655 Fake Road",
                                          city: "New York",
                                          state: "NY",
                                          zip_code: "97702"})
    end
    assert_not flash.empty?
    assert_redirected_to @account
  end
end
