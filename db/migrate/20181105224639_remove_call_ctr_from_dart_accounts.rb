class RemoveCallCtrFromDartAccounts < ActiveRecord::Migration[5.1]
  def change
    remove_column :dartaccounts, :cost_ctr
  end
end
