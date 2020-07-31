class CreateModalities < ActiveRecord::Migration[6.0]
  def change
    create_table :modalities do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :modalities, :code, unique: true, name: 'uidx_modalities_code'
  end
end
