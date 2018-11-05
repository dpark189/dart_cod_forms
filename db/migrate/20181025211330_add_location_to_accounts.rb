class AddLocationToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :location, :string, limit: 2
    change_column :accounts, :location, :string, null: false
  end
end
