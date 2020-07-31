class CreateCycleModalities < ActiveRecord::Migration[6.0]
  def change
    create_table :cycle_modalities do |t|
      t.references :academic_cycle, null: false, foreign_key: true
      t.references :modality, null: false, foreign_key: true

      t.timestamps
    end
    add_index :cycle_modalities, %i[academic_cycle_id modality_id], unique: true,
              name: 'uidx_cycle_modalities'
  end
end
