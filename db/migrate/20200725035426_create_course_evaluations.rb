class CreateCourseEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :course_evaluations do |t|
      t.references :grade_course, null: false, foreign_key: true
      t.references :campus_evaluation, null: false, foreign_key: true
      t.references :professor, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
    add_index :course_evaluations, %i[grade_course_id campus_evaluation_id
                                      professor_id group_id], unique: true,
              name: 'uidx_course_evaluations'
  end
end
