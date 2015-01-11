json.array!(@brands) do |brand|
  json.extract! brand, :id, :name, :description, :aw_brand_id
  json.url brand_url(brand, format: :json)
end
