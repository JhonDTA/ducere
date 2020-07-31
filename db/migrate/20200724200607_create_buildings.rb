class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :code, limit: 16, null: false
      t.text :description
      t.references :campus, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :buildings, %i[campus_id code], unique: true,
              name: 'uidx_buildings_campus_code'
  end
end
