class CreateEvaluationPeriods < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluation_periods do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :evaluation_periods, :code, unique: true,
              name: 'uidx_evaluation_periods_code'
  end
end
