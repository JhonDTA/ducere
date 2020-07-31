class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name, null: false
      t.string :iso_code, null: false, limit: 4
      t.string :calling_code, limit: 10

      t.timestamps
    end

    add_index :countries, :iso_code, unique: true,
              name: 'uidx_countries_iso_code'
  end
end
