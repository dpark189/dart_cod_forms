class RenameAccountsTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :accounts, :dartaccounts
  end
end
