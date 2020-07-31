class CreateTurnEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :turn_evaluations do |t|
      t.references :cycle_turn, null: false, foreign_key: true
      t.references :evaluation_period, null: false, foreign_key: true

      t.timestamps
    end
    add_index :turn_evaluations, %i[cycle_turn_id evaluation_period_id],
              unique: true, name: 'uidx_turn_evaluations'
  end
end
