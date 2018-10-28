# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: "a_user", password: "password", role: "accounting")
User.create!(username: "l_user", password: "password", role: "logistics")

def create_account(num)
  received = rand(1..2000)
  date = Date.today

  Account.create!(
    ship_date: date,
    route_number: rand(1..10),
    customer_id: "CN#{num}",
    customer: "CustomerName#{num}",
    amount_owed: rand(1..2000),
    extra: 10,
    amount_received: received,
    received_as_cash_or_check: received,
    logistics_agent_initials: "ad",
    location: 'nj'
  )
end
create_account(11)
10.times do |i|
  create_account(i)
end
