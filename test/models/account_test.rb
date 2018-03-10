require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  def setup
    @account = accounts(:one)
  end

  test "should be valid" do
    assert @account.valid?
  end

  test "account_number should be present" do
    @account.account_number = "     "
    assert_not @account.valid?
  end

  test "account_number should be unique" do
    duplicate_account = @account.dup
    duplicate_account.email = @account.email.upcase
    @account.save
    assert_not duplicate_account.valid?
  end

  test "email should not be too long" do
    @account.email = "a" * 244 + "@example.com"
    assert_not @account.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @account.email = valid_address
      assert @account.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user@example..com user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @account.email = invalid_address
      assert_not @account.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @account.email = mixed_case_email
    @account.save
    assert_equal mixed_case_email.downcase, @account.reload.email
  end
end
