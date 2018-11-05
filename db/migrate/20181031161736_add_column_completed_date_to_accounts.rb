class AddColumnCompletedDateToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :logistics_completed_date, :datetime
    add_column :accounts, :accounting_completed_date, :datetime
  end
end
