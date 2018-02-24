htmljson.extract! account, :id, :address1, :address2, :city, :state, :zip_code, :notes, :created_at, :updated_at
json.url account_url(account, format: :json)
