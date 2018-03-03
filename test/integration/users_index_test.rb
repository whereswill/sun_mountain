require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:michael)
    @non_admin = users(:archer)
    @non_active = users(:malory)
  end

  test "index as non-admin" do
    log_in_as(@non_admin)
    get users_path
    assert_template 'users/index'
    assert_select 'table#users'
    assert_select 'a', text: 'edit', count: 0
    assert_select "i.glyphicon-trash", count: 0
    assert_select 'span', text: 'Verified', count: 0
    first_page_of_users = User.where(activated: true).order(:name)
    assert_select 'a[href=?]', user_path(@non_active), text: @non_active.name, count: 0
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'table#users'
    assert_select 'a[href=?]', signup_path
    first_page_of_users = User.where(archived_at: nil).order(:name)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      if user.last_logged_in
        assert_select 'span', date: user.last_logged_in
      end
      assert_select 'a[href=?]', edit_user_path(user)
      unless user == @admin
        assert_select 'a[href=?]', archive_user_path(user)
        assert_select 'a[href=?]', user_path(user)
        assert_select "i.glyphicon-trash"
        if user.activated?
          assert_select 'div', text: 'Verified'
        else
          assert_select 'a[href=?]', account_activation_path(user), text: 'Resend verification email'
        end
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end
end
