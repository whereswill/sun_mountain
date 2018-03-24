class Invoice < ApplicationRecord
  attribute :status, :integer, default: 0

  belongs_to :account

  validates :account_id, :presence => true
  validates :status, inclusion: { in: %w(draft sent paid) }
  validates :late_fee, numericality: { allow_nil: true }
  belongs_to :account

  enum status: [:draft, :sent, :paid]
end
