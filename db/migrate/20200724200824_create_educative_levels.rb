class CreateEducativeLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :educative_levels do |t|
      t.string :code, limit: 16
      t.string :name, limit: 255
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
