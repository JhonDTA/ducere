class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.string :name, limit: 255
      t.references :status, null: false, foreign_key: true

      t.timestamps
    end
  end
end
