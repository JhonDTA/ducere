class CreateCourseMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :course_marks do |t|
      t.references :student_course, null: false, foreign_key: true
      t.numeric :mark, null: false, default: 10
      t.integer :attendance, limit: 2, null: false, default: 0
      t.text :observations

      t.timestamps
    end
    add_index :course_marks, :student_course_id, unique: true,
              name: 'uidx_course_marks'
  end
end
