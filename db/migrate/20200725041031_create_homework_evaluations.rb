class CreateHomeworkEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :homework_evaluations do |t|
      t.references :student_homework, null: false, foreign_key: true
      t.integer :mark, limit: 1
      t.text :observations

      t.timestamps
    end
  end
end
