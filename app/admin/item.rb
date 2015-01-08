ActiveAdmin.register Item do

  permit_params :name, :description, :image_url, :active, :category_ids

  form do |f|
    f.inputs "Item Details" do
      f.input :name
      f.input :description
      f.input :image_url, :as => :url
      f.input :active
    end
    f.inputs "Categories" do
      f.input :categories
    end
    f.actions
    end

end
