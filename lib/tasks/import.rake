require 'rubygems'
require 'zip'
require 'open-uri'
require 'csv'

namespace :import do
  desc 'Imports Affiliate Window products'

  ALLOWED_PRODUCT_ATTRIBUTES = [ :merchant, :affiliate_program, :brand, :active, :notes, :aw_product_id, :aw_deep_link, :aw_image_url, :aw_thumb_url, :merchant_product_id, :merchant_category, :merchant_image_url, :merchant_deep_link, :product_name, :description, :parent_product_id, :brand_name, :brand_id, :model_number, :colour, :condition, :keywords, :product_type, :promotional_text, :specifications, :currency, :search_price, :display_price, :rrp_price, :saving, :store_price, :delivery_cost, :delivery_restrictions, :delivery_time, :in_stock, :is_for_sale, :pre_order, :valid_from, :valid_to, :web_offer, :average_rating, :reviews, :rating, :last_updated ]

  task products: :environment do

    affiliate = AffiliateProgram.find_or_create_by(name: 'Affiliate Window')

    file = open(URI.parse(APP_CONFIG['affiliate_window_feed']))

    Zip::File.open(file) do |zip_file|

      zip_file.each do |entry|

        csv = CSV.new(entry.get_input_stream.read, :encoding => 'ISO-8859-1:UTF8', :headers => true, :header_converters => :symbol)
        csv = csv.to_a.map { |row| row.to_hash }

        csv.each do |row|

          begin

            product = Product.find_or_initialize_by(aw_product_id: row[:aw_product_id])

            # Only update new products or those that have been changed since last import
            if product.id.nil? || product.last_updated != row[:last_updated]

              product.affiliate_program = affiliate

              # Force Encode strings to UTF8
              row.each { |k, v| row[k] = v.force_encoding("utf-8") if v.is_a? String }

              # Find or create a new merchant
              merchant = Merchant.find_or_initialize_by(merchant_id: row[:merchant_id])
              product.merchant = merchant
              if merchant.id.nil? ##TODO: Missing names?
                merchant.update_attributes( name: row[:merchant_name], merchant_id: row[:merchant_id] )
                merchant.save
                puts "Saved Merchant: #{row[:merchant_id]}"
              end

              # Find or create a new brand by the brand name
              brand = Brand.find_or_initialize_by(name: row[:brand_name])
              product.brand = brand
              if brand.id.nil?
                brand.save
                puts "Saved Brand: #{row[:brand_name]}"
              end

              product_data = row.keep_if { |i| ALLOWED_PRODUCT_ATTRIBUTES.include? i }
              product_data.delete(:brand_id) # Remove this as it conflicts with the association
              product.update_attributes(product_data)
              product.save
              puts "Saved Product: #{row[:product_name]}"
            end

          rescue
            puts "Error: #{row[:product_name]}: #{$!}"
          end

          # Todo... flag products as inactive

        end
      end
    end
  end

end

