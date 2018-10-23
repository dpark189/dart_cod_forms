class DropLogisticsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :logistics
  end
end
