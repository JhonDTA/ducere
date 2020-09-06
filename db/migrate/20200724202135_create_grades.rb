class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.string :name, limit: 255, null: false
      t.integer :sequence, limit: 2, null: false
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :grades, %i[name sequence], unique: true,
              name: 'uidx_grades_name_sequence'
  end
end
