class CreateCourseHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :course_homeworks do |t|
      t.references :course_evaluation, null: false, foreign_key: true
      t.string :name, limit: 255
      t.text :description

      t.timestamps
    end
  end
end
