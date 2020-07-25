class CreateStudentHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :student_homeworks do |t|
      t.references :course_homework, null: false, foreign_key: true
      t.references :student, null: false, foreign_key: true
      t.text :observations

      t.timestamps
    end
  end
end
