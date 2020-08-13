class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :iso_code, limit: 3, null: false
      t.string :name, limit: 255, null: false
      t.string :symbol, limit: 8, null: false

      t.timestamps
    end
    add_index :currencies, :iso_code, unique: true,
              name: 'uidx_currencies_index'
  end
end
