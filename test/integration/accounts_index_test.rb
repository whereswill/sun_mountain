require 'test_helper'

class AccountsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @account = accounts(:one)
    @admin     = users(:michael)
    @non_admin = users(:archer)
  end

  test "accounts as non-admin" do
    log_in_as(@non_admin)
    get accounts_path
    assert_select 'a[href=?]', new_account_path
    assert_select 'a[href=?]', account_path(@account)
    assert_select 'a[href=?]', edit_account_path(@account)
    assert_select "i.glyphicon-trash", count: 0
    assert_select 'div.pagination'
  end

  test "accounts as admin including pagination and delete links" do
    log_in_as(@admin)
    get accounts_path
    assert_template 'accounts/index'
    assert_select 'div.pagination'
    first_page_of_accounts = Account.all.paginate(page: 1)
    first_page_of_accounts.each do |del|
      assert_select 'a[href=?]', account_path(del)
      assert_select 'a[href=?]', edit_account_path(del)
      assert_select "i.glyphicon-trash"
    end
    assert_difference 'Account.count', -1 do
      delete account_path(@account)
    end
  end
end
