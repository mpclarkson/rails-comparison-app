json.array!(@products) do |product|
  json.extract! product, :id, :aw_product_id, :aw_deep_link, :aw_image_url, :aw_thumb_url, :merchant_product_id, :merchant_category, :merchant_image_url, :merchant_deep_link, :product_name, :description, :parent_product_id, :brand_name, :brand_id, :model_number, :colour, :condition, :keywords, :product_type, :promotional_text, :specifications, :currency, :search_price, :display_price, :rrp_price, :saving, :store_price, :delivery_cost, :delivery_restrictions, :delivery_time, :in_stock, :is_for_sale, :pre_order, :valid_from, :valid_to, :web_offer, :average_rating, :reviews, :rating, :last_updated
  json.url product_url(product, format: :json)
end
