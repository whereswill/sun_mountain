class Account < ApplicationRecord
  attr_accessor :delivery_address

  before_save   :downcase_email
  validates :account_number, presence: true,
                             uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :phone, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    allow_blank: true,
                    format: { with: VALID_EMAIL_REGEX }

  has_many :addresses, dependent: :destroy
  has_many :invoices, dependent: :destroy
  accepts_nested_attributes_for :addresses, :invoices

  def delivery_address
    # address = self.addresses.where(address_type: 1)
    # binding.pry
    # address.address1

    self.addresses.each do |a|
      # binding.pry
      return a.address1 if a.type_name == "Delivery"
    end
  end
end
