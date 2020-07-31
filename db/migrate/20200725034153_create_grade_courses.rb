class CreateGradeCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :grade_courses do |t|
      t.references :syllabus_grade, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
    add_index :grade_courses, %i[syllabus_grade_id course_id], unique: true,
              name: 'uidx_grade_courses'
  end
end
