json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :name, :description, :merchant_id
  json.url merchant_url(merchant, format: :json)
end
