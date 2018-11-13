# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if !User.find_by(username: "a_user") || !User.find_by(username: "l_user")
  User.create!(username: "a_user", password: "password", role: "accounting")
  User.create!(username: "l_user", password: "password", role: "logistics")
end
# 
# def create_account(num)
#   received = rand(1..2000)
#   date = Date.today
#
#   Account.create!(
#     ship_date: date,
#     route_number: rand(1..10),
#     customer_id: "CN#{num}",
#     customer: "CustomerName#{num}",
#     amount_owed: rand(1..2000),
#     amount_received: 0,
#     received_as_check_or_cash: 0,
#     logistics_agent_initials: "",
#     location: 'nj'
#   )
# end
# create_account(11)
# 10.times do |i|
#   create_account(i)
# end
