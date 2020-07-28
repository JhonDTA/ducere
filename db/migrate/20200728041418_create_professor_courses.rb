class CreateProfessorCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :professor_courses do |t|
      t.references :professor, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
