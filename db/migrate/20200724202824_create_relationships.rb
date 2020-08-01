class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.string :name, limit: 255, null: false
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
    add_index :relationships, :name, unique: true,
              name: 'uidx_relationships_name'
  end
end
