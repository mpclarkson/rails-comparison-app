ActiveAdmin.register Product do

  permit_params :product_name, :description, :active, :notes, :category_ids

  form do |f|
    f.inputs "Product Details" do
      f.input :product_name
      f.input :description
      f.input :notes
      f.input :active
    end
    f.inputs "Categories" do
      f.input :categories
    end
    f.actions
  end

  index do
    column :image do |product|
      image_tag product.aw_thumb_url
    end
    column :id
    column :product_name
    column :brand_name
    column :last_updated
    column :merchant
    column :currency
    column :search_price
    column :page_views
    actions
  end

  filter :product_name
  filter :currency
  filter :merchant, as: :select, collection: proc { Merchant.all.order(name: :asc) }
  filter :brand, as: :select, collection: proc { Brand.all.order(name: :asc) }

end
