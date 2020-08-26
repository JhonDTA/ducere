class CreateInstutionAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :instution_addresses do |t|
      t.references :institution, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
    add_index :instution_addresses, %i[institution_id address_id], unique: true,
              name: 'uidx_institution_address'
  end
end
