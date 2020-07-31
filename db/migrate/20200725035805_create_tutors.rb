class CreateTutors < ActiveRecord::Migration[6.0]
  def change
    create_table :tutors do |t|
      t.references :student, null: false, foreign_key: true
      t.references :parent, null: false, foreign_key: true
      t.references :relationship, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tutors, %i[student_id parent_id], unique: true,
              name: 'uidx_tutors'
  end
end
