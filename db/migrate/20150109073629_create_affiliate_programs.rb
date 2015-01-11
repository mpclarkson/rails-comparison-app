class CreateAffiliatePrograms < ActiveRecord::Migration
  def change
    create_table :affiliate_programs do |t|
      t.string :name
      t.string :display_name
      t.text :description

      t.timestamps null: false
    end
  end
end
