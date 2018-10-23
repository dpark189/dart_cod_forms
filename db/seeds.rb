# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(username: "a_user", password: "password", role: "accounting")
# User.create!(username: "l_user", password: "password", role: "logistics")

Account.create!(
  ship_date: Date.now.to_date,
  route_number: 1,
  customer_id: "CN",
  customer: "CustomerName",
  amount_owed: 1000,
  extra: 10,
  amount_received: 1000,
  received_as_cash_or_check: 1000,
  logistics_agent_initials: "AD"
)
