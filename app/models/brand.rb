class Brand < ActiveRecord::Base
  is_impressionable counter_cache: true, column_name: :page_views
  has_many :products
end
