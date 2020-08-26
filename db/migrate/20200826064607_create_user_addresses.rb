class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
    add_index :user_addresses, %i[user_id address_id], unique: true,
              name: 'uidx_user_address'
  end
end
