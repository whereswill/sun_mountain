class Delivery < ApplicationRecord

  validates :address1, :city, :state, :zip_code, presence: true

end
