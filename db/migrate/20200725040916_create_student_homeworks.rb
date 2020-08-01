class CreateStudentHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :student_homeworks do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course_homework, null: false, foreign_key: true
      t.text :observations

      t.timestamps
    end
    add_index :student_homeworks, %i[course_homework_id student_id],
              unique: true, name: 'uidx_student_homeworks'
  end
end
