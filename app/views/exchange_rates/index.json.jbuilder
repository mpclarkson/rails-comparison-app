json.array!(@exchange_rates) do |exchange_rate|
  json.extract! exchange_rate, :id, :from_currency, :to_currency, :rate
  json.url exchange_rate_url(exchange_rate, format: :json)
end
