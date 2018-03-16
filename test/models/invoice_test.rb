require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase

  def setup
    @account = accounts(:one)
    @invoice = @account.invoices.build(account_id: @account.id,
                                        status: "draft",
                                        notes: "foobar",
                                        late_fee: 5.00)
  end

  test "test @invoice should be valid" do
    assert @invoice.valid?
  end

  test "status should be present" do
    @invoice.status = "     "
    assert_not @invoice.valid?
  end

  test "status should be 1 of 3 statuses" do
    ["urgent", "handsome", "rich"]. each do |n|
      @invoice.status = n
      assert_not @invoice.valid?
    end
  end

  test "status should be from list" do
    ["draft", "sent", "paid"]. each do |n|
      @invoice.status = n
      assert @invoice.valid?
    end
  end

  test "late_fee should be a number" do
    @invoice.late_fee = "believe"
    assert_not @invoice.valid?
  end

  # test "late_fee should be 6.2 precision" do
  #   @invoice.late_fee = 65.25698
  #   assert_not @invoice.valid?
  # end

  # test "deleting invoice should delete readings too" do
  #   reading = Reading.new(:description => 'Lorem Ipsum', :unit_cost => 1, :quantity => 1, :discount => 0, :invoice_id => invoice.id)
  #   assert reading.save

  #   @invoice.destroy

  #   assert_not Reading.exists?(reading.id)
  # end

end
