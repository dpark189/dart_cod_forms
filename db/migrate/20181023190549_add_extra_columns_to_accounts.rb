class AddExtraColumnsToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :credit, :integer
  end
end
