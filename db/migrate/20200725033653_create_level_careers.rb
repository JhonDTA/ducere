class CreateLevelCareers < ActiveRecord::Migration[6.0]
  def change
    create_table :level_careers do |t|
      t.references :educative_level, null: false, foreign_key: true
      t.references :career, null: false, foreign_key: true

      t.timestamps
    end
  end
end
