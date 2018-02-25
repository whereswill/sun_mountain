class AddDetailsToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :first_name, :string
    add_column :accounts, :last_name, :string
    add_column :accounts, :account_number, :string
    add_column :accounts, :phone, :string
    add_column :accounts, :email, :string
  end
end
