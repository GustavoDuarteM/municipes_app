class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :full_name
      t.string :CPF
      t.string :CNS
      t.string :email
      t.date :birth_date
      t.string :phone
      t.references :town, null: false, foreign_key: true

      t.timestamps
    end
  end
end
