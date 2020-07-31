class CreateClassrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :classrooms do |t|
      t.string :code, limit: 16, null: false
      t.text :description
      t.references :building, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :classrooms, %i[building_id code], unique: true,
              name: 'uidx_classrooms_building_code'
  end
end
