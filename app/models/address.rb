class Address < ApplicationRecord
  attr_accessor :type_name

  validates :address_type, :address1, :city, :state, :zip_code, presence: true
  validates :address_type, uniqueness: { scope: :account_id }

  belongs_to :account, optional: true

  def type_name
    name = {1 => "Delivery",
            2 => "Mailing"}
    name[self.address_type] ||= "Unknown"
  end
end
