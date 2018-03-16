json.extract! invoice, :id, :status, :notes, :late_fee, :late_fee, :account_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)