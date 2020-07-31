class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course_evaluation, null: false, foreign_key: true

      t.timestamps
    end
    add_index :student_courses, %i[student_id course_evaluation_id],
              unique: true, name: 'uidx_student_courses'
  end
end
