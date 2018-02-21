htmljson.extract! delivery, :id, :address1, :address2, :city, :state, :zip_code, :notes, :created_at, :updated_at
json.url delivery_url(delivery, format: :json)
