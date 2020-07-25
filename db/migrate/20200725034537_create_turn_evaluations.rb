class CreateTurnEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :turn_evaluations do |t|
      t.references :cycle_turn, null: false, foreign_key: true
      t.references :evaluation_period, null: false, foreign_key: true

      t.timestamps
    end
  end
end
