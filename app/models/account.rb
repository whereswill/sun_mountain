class Account < ApplicationRecord

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
end
