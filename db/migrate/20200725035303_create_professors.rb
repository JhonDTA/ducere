class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :enrollment, limit: 32

      t.timestamps
    end
    add_index :professors, :user_id, unique: true, name: 'uidx_professors_user'
  end
end
