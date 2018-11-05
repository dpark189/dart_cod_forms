class DropAccountingsTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :accountings
  end
end
