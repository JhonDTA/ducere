class CreateModalities < ActiveRecord::Migration[6.0]
  def change
    create_table :modalities do |t|
      t.string :code, limit: 16
      t.string :name, limit: 255
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
