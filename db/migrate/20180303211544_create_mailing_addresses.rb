class CreateMailingAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :mailing_addresses do |t|
      t.references :account, foreign_key: true
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
