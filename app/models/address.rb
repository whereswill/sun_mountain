class Address < ApplicationRecord
  attr_accessor :type_name

  validates :address1, :city, :state, :zip_code, presence: true
  # validates_inclusion_of :address_type, in: 1..2

  belongs_to :account

  def type_name
    name = {1 => "Delivery",
            2 => "Mailing"}
    name[self.address_type] ||= "Unknown"
  end
end
