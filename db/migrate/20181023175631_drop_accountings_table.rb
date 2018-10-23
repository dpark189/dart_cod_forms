class DropAccountingsTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :accountings
  end
end
