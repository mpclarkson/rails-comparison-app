class AddPageViewsColumnToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :page_views, :integer
  end
end
