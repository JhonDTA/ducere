class CreateSyllabuses < ActiveRecord::Migration[6.0]
  def change
    create_table :syllabuses do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.integer :approval_credits, limit: 2, null: false, default: 0
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :syllabuses, :code, unique: true, name: 'uidx_syllabuses_code'
  end
end
