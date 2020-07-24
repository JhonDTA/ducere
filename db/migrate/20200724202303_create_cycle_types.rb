class CreateCycleTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :cycle_types do |t|
      t.string :code, limit: 16
      t.string :name, limit: 255
      t.text :description
      t.integer :duration, limit: 2
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
