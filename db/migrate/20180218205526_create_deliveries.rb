class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.text :notes

      t.timestamps
    end
  end
end
