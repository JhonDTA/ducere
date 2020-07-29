class CreateTurns < ActiveRecord::Migration[6.0]
  def change
    create_table :turns do |t|
      t.string :code, limit: 16
      t.string :name, limit: 255
      t.text :description
      t.time :start
      t.time :finish
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
