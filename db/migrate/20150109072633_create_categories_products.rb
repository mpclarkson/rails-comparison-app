
class CreateCategoriesProducts < ActiveRecord::Migration
  create_table :categories_products, :id => false do |t|
    t.belongs_to :category
    t.belongs_to :product
  end

  add_index :categories_products, :category
  add_index :categories_products, :product

end

