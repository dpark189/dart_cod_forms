class ChangeAccountsTabelName < ActiveRecord::Migration[5.2]
  def change
    rename_table :accounts_tables, :accounts
  end
end
