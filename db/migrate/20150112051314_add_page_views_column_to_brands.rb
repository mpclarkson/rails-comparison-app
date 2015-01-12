class AddPageViewsColumnToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :page_views, :integer
  end
end
