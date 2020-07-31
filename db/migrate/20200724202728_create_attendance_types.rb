class CreateAttendanceTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_types do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :attendance_types, :code, unique: true,
              name: 'uidx_attendance_types_code'
  end
end
