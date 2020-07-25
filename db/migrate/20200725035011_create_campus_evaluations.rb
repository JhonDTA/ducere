class CreateCampusEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :campus_evaluations do |t|
      t.references :campus, null: false, foreign_key: true
      t.references :turn_evaluation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
