class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.references :user, null: false, foreign_key: true
      t.string :enrollment, limit: 32, null: false

      t.timestamps
    end
    add_index :students, :user_id, unique: true, name: 'uidx_students_user'
    add_index :students, :enrollment, unique: true,
              name: 'uidx_students_enrollment'
  end
end
