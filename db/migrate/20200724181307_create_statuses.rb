class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.string :code, limit: 16, null: false
      t.string :name, limit: 255, null: false
      t.text :description

      t.timestamps
    end
    add_index :statuses, :code, unique: true, name: 'uidx_statuses_code'
  end
end
