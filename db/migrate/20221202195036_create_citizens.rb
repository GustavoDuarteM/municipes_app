class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :full_name, null: false
      t.string :CPF, null: false
      t.string :CNS, null: false
      t.string :email, null: false
      t.date :birth_date, null: false
      t.string :phone, null: false
      t.references :town, null: false, foreign_key: true

      t.timestamps
    end
  end
end
