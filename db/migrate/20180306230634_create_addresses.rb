class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :address_type
      t.string :care_of
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
