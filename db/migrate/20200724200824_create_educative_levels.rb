class CreateEducativeLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :educative_levels do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :educative_levels, :code, unique: true,
              name: 'uidx_educative_levels_code'
  end
end
