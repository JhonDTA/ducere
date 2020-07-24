class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :statuses do |t|
      t.string :code, limit: 16
      t.string :name, limit: 255
      t.text :description

      t.timestamps
    end
  end
end
