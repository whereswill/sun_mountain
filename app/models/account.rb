class Account < ApplicationRecord

  has_one :mailing_address, dependent: :destroy

  before_save   :downcase_email
  validates :account_number, presence: true,
                             uniqueness: { case_sensitive: false }
  validates :first_name, :last_name, :address1, :city,
            :state, :zip_code, :phone, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    allow_blank: true,
                    format: { with: VALID_EMAIL_REGEX }
end
