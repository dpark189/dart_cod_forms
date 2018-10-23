class CreateAccountsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts_tables do |t|
      t.datetime :ship_date, null: false
      t.integer :invoice_number
      t.integer :route_number, null: false
      t.string :customer_id, null: false
      t.string :customer, null: false
      t.integer :amount_owed
      t.integer :extra
      t.integer :amount_received
      t.integer :ammount_credit
      t.integer :received_as_cash_or_check
      t.string :logistics_agent_initials
      t.string :reason_code
      t.string :reason_details
    end
  end
end
