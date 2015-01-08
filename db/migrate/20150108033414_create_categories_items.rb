class CreateCategoriesItems < ActiveRecord::Migration
  def change
    create_table :categories_items, :id => false do |t|
        t.belongs_to :item, index: true
        t.belongs_to :category, index: false
    end
  end
end
