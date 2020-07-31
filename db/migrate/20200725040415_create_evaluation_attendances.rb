class CreateEvaluationAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluation_attendances do |t|
      t.references :student_course, null: false, foreign_key: true
      t.references :attendance_type, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
    add_index :evaluation_attendances, %i[student_course_id
                                          attendance_type_id date],
              unique: true, name: 'uidx_evaluation_attendances'
  end
end
