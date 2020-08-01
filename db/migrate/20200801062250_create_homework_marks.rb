class CreateHomeworkMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :homework_marks do |t|
      t.references :student_homework, null: false, foreign_key: true
      t.float :mark, null: false, default: 10
      t.text :observations

      t.timestamps
    end
    add_index :homework_marks, :student_homework_id, unique: true,
              name: 'uidx_homework_marks'
  end
end
