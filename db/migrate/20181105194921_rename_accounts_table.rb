class RenameAccountsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :accounts, :dartaccounts
  end
end
