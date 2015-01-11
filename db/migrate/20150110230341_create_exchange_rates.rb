class CreateExchangeRates < ActiveRecord::Migration
  def change
    create_table :exchange_rates do |t|
      t.string :from_currency
      t.string :to_currency
      t.float :rate

      t.timestamps null: false
    end
    add_index :exchange_rates, :from_currency
    add_index :exchange_rates, :to_currency
    add_index :exchange_rates, [:from_currency, :to_currency]
  end
end
