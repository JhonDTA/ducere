class CreateCampus < ActiveRecord::Migration[6.0]
  def change
    create_table :campus do |t|
      t.string :name, null: false
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
