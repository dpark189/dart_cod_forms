class AddExtraColumnsToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :credit, :integer
  end
end
