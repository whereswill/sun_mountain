class AddUniqueIndexToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_index :addresses, [:account_id, :address_type], unique: true
  end
end
