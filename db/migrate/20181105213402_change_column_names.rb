class ChangeColumnNames < ActiveRecord::Migration[5.1]
  def change
    change_column :dartaccounts, :invoice_number, :string
    change_column :dartaccounts, :route_number, :string
    change_column :dartaccounts, :amount_owed, :float
    change_column :dartaccounts, :extra, :float
    change_column :dartaccounts, :amount_received, :float
    change_column :dartaccounts, :amount_credit, :float
    change_column :dartaccounts, :received_as_check_or_cash, :string
    change_column :dartaccounts, :credit, :float
  end
end
