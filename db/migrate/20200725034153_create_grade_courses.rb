class CreateGradeCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :grade_courses do |t|
      t.references :syllabus_grade, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
