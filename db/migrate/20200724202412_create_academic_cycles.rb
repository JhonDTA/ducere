class CreateAcademicCycles < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_cycles do |t|
      t.string :code, limit: 16
      t.string :name, limit: 255
      t.text :description
      t.references :cycle_type, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.date :start
      t.date :finish

      t.timestamps
    end
  end
end
