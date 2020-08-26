class CreateMunicipalities < ActiveRecord::Migration[6.0]
  def change
    create_table :municipalities do |t|
      t.references :state, null: false, foreign_key: true
      t.string :name, limit: 255, null: false

      t.timestamps
    end
    add_index :municipalities, %i[state_id name], unique: true,
              name: 'uidx_municipalities_state_name'
  end
end
