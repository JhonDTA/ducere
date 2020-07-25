class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course_evaluation, null: false, foreign_key: true
      t.integer :mark, limit: 1
      t.integer :attendance, limit: 2
      t.text :observations

      t.timestamps
    end
  end
end
