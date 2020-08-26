class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :settlement, null: false, foreign_key: true
      t.string :street, limit: 255, null: false
      t.string :interior_number, limit: 50
      t.string :exterior_number, limit: 50
      t.text :reference

      t.timestamps
    end

  end
end
