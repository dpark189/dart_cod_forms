# == Schema Information
#
# Table name: accounts
#
#  id                        :bigint(8)        not null, primary key
#  ship_date                 :datetime         not null
#  invoice_number            :integer
#  route_number              :integer          not null
#  customer_id               :string           not null
#  customer                  :string           not null
#  amount_owed               :integer
#  extra                     :integer
#  amount_received           :integer
#  ammount_credit            :integer
#  received_as_cash_or_check :integer
#  logistics_agent_initials  :string
#  reason_code               :string
#  reason_details            :string
#  credit                    :integer
#  completed                 :boolean
#

class Account < ApplicationRecord
  validates :ship_date, :route_number, :customer_id, :customer, :completed, presence: true
  validates :logistics_agent_initials, presence: true, if: :amount_received, length: {is: 2}
end
