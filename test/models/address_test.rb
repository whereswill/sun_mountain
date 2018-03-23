require 'test_helper'

class AddressTest < ActiveSupport::TestCase

  def setup
    @account = accounts(:one)
    @address = @account.addresses.build(account_id: @account.id,
                                        address_type: "mailing",
                                        address1: "123 Test Lane",
                                        city: "Bend",
                                        state: "OR",
                                        zip_code: "78654")
  end

  test "test @address should be valid" do
    assert @address.valid?
  end

  test "address_type should be present" do
    @address.address_type = "     "
    assert_not @address.valid?
  end

  test "address1 should be present" do
    @address.address1 = "     "
    assert_not @address.valid?
  end

  test "city should be present" do
    @address.city = "     "
    assert_not @address.valid?
  end

  test "state should be present" do
    @address.state = "     "
    assert_not @address.valid?
  end

  test "zip should be present" do
    @address.zip_code = "     "
    assert_not @address.valid?
  end

  test "account_number and address_type should be unique" do
    duplicate_address = @address.dup
    @address.save
    assert_not duplicate_address.valid?
  end
end
