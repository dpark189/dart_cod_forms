class RenameColumnCompletedOnAccounts < ActiveRecord::Migration[5.1]
  def change
    rename_column :accounts, :completed, :accounting_completed
    add_column :accounts, :logistics_completed, :boolean
  end
end
