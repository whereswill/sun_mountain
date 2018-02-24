require 'test_helper'

class AccountsEditTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @admin_user = users(:michael)
    log_in_as(@admin_user)
  end

  test "unsuccessful edit with invalid info" do
    get edit_account_path(@account)
    assert_template 'accounts/edit'
    patch account_path(@account), params: { account: { address1:  "",
                                              city: "",
                                              state:  "",
                                              zip_code: "" } }

    assert_template 'accounts/edit'
    # assert_select 'div.alert-danger', "The form contains 4 errors."
  end

  test "successful edit for admin" do
    get edit_account_path(@account)
    assert_template 'accounts/edit'
    address1  = "333 N. High St."
    zip_code = "89076"
    patch account_path(@account), params: { account: { address1:  address1,
                                              city: "Golden",
                                              state:  "CO",
                                              zip_code: zip_code } }
    assert_not flash.empty?
    assert_redirected_to @account
    @account.reload
    assert_equal address1,  @account.address1
    assert_equal zip_code, @account.zip_code
  end
end
