class CreateCampusAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :campus_addresses do |t|
      t.references :campus, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
    add_index :campus_addresses, %i[campus_id address_id], unique: true,
              name: 'uidx_campus_address'
  end
end
