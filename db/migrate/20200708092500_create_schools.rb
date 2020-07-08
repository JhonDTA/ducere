class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :code, null: false, limit: 64
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end

    add_index :schools, :code, unique: true
  end
end
