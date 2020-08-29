class CreateCareerSyllabuses < ActiveRecord::Migration[6.0]
  def change
    create_table :career_syllabuses do |t|
      t.references :career, null: false, foreign_key: true
      t.references :syllabus, null: false, foreign_key: true

      t.timestamps
    end
    add_index :career_syllabuses, %i[career_id syllabus_id], unique: true,
              name: 'uidx_career_syllabuses'
  end
end
