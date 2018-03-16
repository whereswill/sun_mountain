class Invoice < ApplicationRecord
  validates :account_id, :presence => true
  validates :status, :inclusion => { :in => ['draft', 'sent', 'paid'] }
  validates :late_fee, numericality: { allow_nil: true }
  belongs_to :account
end
