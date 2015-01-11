class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

      t.text :notes
      t.boolean :active, default: true

      #associations
      t.belongs_to :merchant, index:true
      t.belongs_to :affiliate_program, index:true
      t.belongs_to :brand, index:true

      #aw attributes
      t.string :aw_product_id
      t.text :aw_deep_link
      t.text :aw_image_url
      t.text :aw_thumb_url
      t.string :merchant_id
      t.text :merchant_product_id
      t.text :merchant_category
      t.text :merchant_deep_link
      t.text :merchant_image_url
      t.string :product_name
      t.text :description
      t.integer :parent_product_id
      t.string :brand_id
      t.string :brand_name
      t.string :model_number
      t.text :colour
      t.string :condition
      t.text :keywords
      t.text :product_type
      t.text :promotional_text
      t.text :specifications
      t.string :currency, limit: 3
      t.float :search_price
      t.string :display_price
      t.float :rrp_price
      t.text :saving
      t.float :store_price
      t.float :delivery_cost
      t.text :delivery_restrictions
      t.string :delivery_time
      t.boolean :in_stock
      t.boolean :is_for_sale
      t.boolean :pre_order
      t.date :valid_from
      t.date :valid_to
      t.boolean :web_offer
      t.text :average_rating
      t.text :reviews
      t.text :rating
      t.datetime :last_updated

      t.timestamps null: false
    end

  end
end
