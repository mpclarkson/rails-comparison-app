ActiveAdmin.register Item do

  permit_params :name, :description, :image_url, :active, :category_ids

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  #
  form do |f|
    f.inputs "Item Details" do
      f.input :name
      f.input :description
      f.input :active
    end
    f.inputs "Categories" do
      f.input :categories
      end
    end

end
