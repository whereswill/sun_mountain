class Address < ApplicationRecord
  attr_accessor :type_name

  validates :address_type, :address1, :city, :state, :zip_code, presence: true
  validates :address_type, uniqueness: { scope: :account_id }

  belongs_to :account, optional: true

  enum address_type: [:delivery, :mailing]

end
