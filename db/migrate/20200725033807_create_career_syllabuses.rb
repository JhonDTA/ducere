class CreateCareerSyllabuses < ActiveRecord::Migration[6.0]
  def change
    create_table :career_syllabuses do |t|
      t.references :level_career, null: false, foreign_key: true
      t.references :syllabus, null: false, foreign_key: true

      t.timestamps
    end
  end
end
