class CreateCareers < ActiveRecord::Migration[6.0]
  def change
    create_table :careers do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.references :educative_level, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :careers, :code, unique: true, name: 'uidx_careers_code'
  end
end
