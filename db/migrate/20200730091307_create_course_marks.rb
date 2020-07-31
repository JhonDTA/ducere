class CreateCourseMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :course_marks do |t|
      t.references :student_course, null: false, foreign_key: true
      t.integer :mark, limit: 1
      t.integer :attendance, limit: 2
      t.text :observations

      t.timestamps
    end
    add_index :course_marks, :student_course_id, unique: true,
              name: 'uidx_course_marks'
  end
end
