class Address < ApplicationRecord
  attr_accessor :type_name

  validates :address1, :city, :state, :zip_code, presence: true
  validates :address_type, uniqueness: { scope: :account_id }

  belongs_to :account

  def type_name
    name = {1 => "Delivery",
            2 => "Mailing"}
    name[self.address_type] ||= "Unknown"
  end
end
