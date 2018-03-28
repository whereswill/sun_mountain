class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.integer :reading
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
