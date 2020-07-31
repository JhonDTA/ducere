class CreateCampusEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :campus_evaluations do |t|
      t.references :campus, null: false, foreign_key: true
      t.references :turn_evaluation, null: false, foreign_key: true

      t.timestamps
    end
    add_index :campus_evaluations, %i[campus_id turn_evaluation_id],
              unique: true, name: 'uidx_campus_evaluations'
  end
end
