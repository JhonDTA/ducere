class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :enrollment, limit: 32

      t.timestamps
    end
  end
end
