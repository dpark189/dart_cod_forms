class DropLogisticsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :logistics
  end
end
