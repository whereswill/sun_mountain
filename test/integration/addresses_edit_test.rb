require 'test_helper'

class AddressesEditTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @address = addresses(:one)
    @admin_user = users(:michael)
    log_in_as(@admin_user)
  end

  test "unsuccessful edit with invalid info" do
    get edit_account_address_path(@account, @address)
    assert_template 'addresses/edit'
    patch account_address_path(id: @account.id,
                              account_id: @account.id,
                               address: { address_type: 2,
                                          address1: "",
                                          city: ""})

    assert_template 'addresses/edit'
  end

  test "successful edit wwith valid info" do
    get edit_account_address_path(@account, @address)
    assert_template 'addresses/edit'
    address1 = "678 N. Fremont"
    city = "Bismark"
    patch account_address_path(id: @account.id,
                              account_id: @account.id,
                               address: { address_type: 2,
                                          address1: address1,
                                          city: city})
    assert_not flash.empty?
    assert_redirected_to @account
    @address.reload
    assert_equal address1,  @address.address1
    assert_equal city, @address.city
  end
end
