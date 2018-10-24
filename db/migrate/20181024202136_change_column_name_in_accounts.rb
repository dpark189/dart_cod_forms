class ChangeColumnNameInAccounts < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :ammount_credit, :amount_credit
  end
end
