class CreateCycleTurns < ActiveRecord::Migration[6.0]
  def change
    create_table :cycle_turns do |t|
      t.references :cycle_modality, null: false, foreign_key: true
      t.references :turn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
