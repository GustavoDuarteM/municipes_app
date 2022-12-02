class CreateTowns < ActiveRecord::Migration[7.0]
  def change
    create_table :towns do |t|
      t.boolean :status

      t.timestamps
    end
  end
end
