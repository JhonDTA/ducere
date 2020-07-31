class CreateCampuses < ActiveRecord::Migration[6.0]
  def change
    create_table :campuses do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description
      t.references :institution, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :campuses, %i[institution_id code], unique: true,
              name: 'uidx_campuses_institution_code'
  end
end
