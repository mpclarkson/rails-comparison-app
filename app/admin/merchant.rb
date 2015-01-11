ActiveAdmin.register Merchant do

  permit_params :name, :description

  filter :name

end
