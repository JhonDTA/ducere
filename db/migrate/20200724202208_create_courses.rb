class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.integer :credits, limit: 2, null: false, default: 0
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :courses, :code, unique: true, name: 'uidx_courses_code'
  end
end
