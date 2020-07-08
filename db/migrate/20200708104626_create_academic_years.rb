class CreateAcademicYears < ActiveRecord::Migration[6.0]
  def change
    create_table :academic_years do |t|
      t.date :start, null: false
      t.date :finish, null: false
      t.references :campu, null: false, foreign_key: true

      t.timestamps
    end

    add_index :academic_years, [:start, :finish, :campu_id], unique: true,
              name: 'uidx_academic_year'
  end
end
