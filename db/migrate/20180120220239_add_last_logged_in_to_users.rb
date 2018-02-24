class AddLastLoggedInToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :last_logged_in, :datetime
  end
end
