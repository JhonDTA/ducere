class CreateSyllabusGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :syllabus_grades do |t|
      t.references :career_syllabus, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true

      t.timestamps
    end
  end
end
