class CreateSettlements < ActiveRecord::Migration[6.0]
  def change
    create_table :settlements do |t|
      t.references :municipality, null: false, foreign_key: true
      t.string :name, limit: 255, null: false
      t.string :zip_code, limit: 16, null: false

      t.timestamps
    end
    add_index :settlements, :zip_code, name: 'idx_settlement_zip_codes'
    add_index :settlements, %i[municipality_id name zip_code], unique: true,
              name: 'uidx_settlements'
  end
end
