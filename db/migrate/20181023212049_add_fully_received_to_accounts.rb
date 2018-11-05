class AddFullyReceivedToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :completed, :boolean
  end
end
