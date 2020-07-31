class CreateTurns < ActiveRecord::Migration[6.0]
  def change
    create_table :turns do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.time :start, null: false
      t.time :finish, null: false
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :turns, :code, unique: true, name: 'uidx_turns_code'
  end
end
