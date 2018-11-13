class ChangeUsersTableToCodUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :users, :cod_users
  end
end
