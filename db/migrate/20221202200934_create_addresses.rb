class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :CEP, null: false
      t.string :street, null: false
      t.string :complement
      t.string :district, null: false
      t.string :city, null: false
      t.string :UF, null: false
      t.string :IBGE
      t.references :citizen, null: false, foreign_key: true

      t.timestamps
    end
  end
end
