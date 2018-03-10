class RemoveAddressFromAccounts < ActiveRecord::Migration[5.0]
  def change
    remove_column :accounts, :address1, :string
    remove_column :accounts, :address2, :string
    remove_column :accounts, :city, :string
    remove_column :accounts, :state, :string
    remove_column :accounts, :zip_code, :string
  end
end
