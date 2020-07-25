class CreateEvaluationAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluation_attendances do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course_evaluation, null: false, foreign_key: true
      t.references :attendance_type, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
