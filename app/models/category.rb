class Category < ActiveRecord::Base
   is_impressionable counter_cache: true, column_name: :page_views
   has_and_belongs_to_many :products
end
