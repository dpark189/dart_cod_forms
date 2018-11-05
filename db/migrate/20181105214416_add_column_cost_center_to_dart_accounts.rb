class AddColumnCostCenterToDartAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :dartaccounts, :cost_ctr, :string
  end
end
