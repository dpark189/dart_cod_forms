class ChangeColumnShipDateInAccountsToDate < ActiveRecord::Migration[5.2]
  def change
    change_column :accounts, :ship_date, :date
  end
end
