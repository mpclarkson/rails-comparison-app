class AddPageViewsColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :page_views, :integer
  end
end
