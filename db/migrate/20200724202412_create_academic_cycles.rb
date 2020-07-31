class CreateAcademicCycles < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_cycles do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.references :cycle_type, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.date :start, null: false
      t.date :finish, null: false

      t.timestamps
    end
    add_index :academic_cycles, :code, unique: true,
              name: 'uidx_academic_cycles_code'
  end
end
