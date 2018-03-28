require 'test_helper'

class ReadingTest < ActiveSupport::TestCase
  def setup
    @invoice = invoices(:one)
    @reading = @invoice.readings.build(invoice_id: @invoice.id,
                                        reading: 123456,
                                        updated_at: Date.today - 30)
    @reading2 = @invoice.readings.build(invoice_id: @invoice.id,
                                        reading: 123457,
                                        updated_at: Date.today)
  end

  test "test @reading should be valid" do
    assert @reading.valid?
  end

  test "reading should be present" do
    @reading.reading = nil
    assert_not @reading.valid?
  end

  test "reading should be an integer" do
    @reading.reading = "Abscde"
    assert_not @reading.valid?
  end

  test "reading should be greater than the last reading" do
    @reading2.reading = 123454
    assert_not @reading2.valid?
  end
end
