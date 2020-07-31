class CreateHomeworkEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :homework_evaluations do |t|
      t.references :student_homework, null: false, foreign_key: true
      t.integer :mark, limit: 1
      t.text :observations

      t.timestamps
    end
    add_index :homework_evaluations, :student_homework_id, unique: true,
              name: 'uidx_homework_evaluations'
  end
end
