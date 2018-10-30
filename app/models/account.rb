# == Schema Information
#
# Table name: accounts
#
#  id                        :bigint(8)        not null, primary key
#  ship_date                 :date             not null
#  invoice_number            :integer
#  route_number              :integer          not null
#  customer_id               :string           not null
#  customer                  :string           not null
#  amount_owed               :integer
#  extra                     :integer
#  amount_received           :integer
#  amount_credit             :integer
#  received_as_cash_or_check :integer
#  logistics_agent_initials  :string
#  reason_code               :string
#  reason_details            :string
#  credit                    :integer
#  accounting_completed      :boolean
#  location                  :string           not null
#  logistics_completed       :boolean
#

class Account < ApplicationRecord
  before_save :default_completed
  before_update :check_logi_complete
  validates :ship_date, :route_number, :customer_id, :customer, presence: true
  validates :logistics_agent_initials, presence: true, if: :amount_received, length: {is: 2}
  validate :check_logi_complete, on: :update

  def default_completed
    self.logistics_completed ||= false
    self.accounting_completed ||= false
  end

  def check_logi_complete
    rec_ammount = self.amount_received
    owed = self.amount_owed
    self.logistics_completed = rec_ammount >= owed ? true : false
  end
end
