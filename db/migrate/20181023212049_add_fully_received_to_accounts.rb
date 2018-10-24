class AddFullyReceivedToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :completed, :boolean
  end
end
