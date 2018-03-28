class Reading < ApplicationRecord
  attr_accessor :last_reading

  belongs_to :invoice

  validates :reading, :presence => true
  validates :reading, numericality: { only_integer: true }

  def last_reading
    account = self.invoice.account_id

  end
end

