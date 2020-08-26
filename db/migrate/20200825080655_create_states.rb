class CreateStates < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.references :country, null: false, foreign_key: true
      t.string :name, limit: 255, null: false

      t.timestamps
    end
    add_index :states, %i[country_id name], unique: true,
              name: 'uidx_states_country_name'
  end
end
