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
#  received_as_check_or_cash :integer
#  logistics_agent_initials  :string
#  reason_code               :string
#  reason_detail            :string
#  credit                    :integer
#  accounting_completed      :boolean
#  location                  :string           not null
#  logistics_completed       :boolean
#

class Account < ApplicationRecord
  def self.reasons
    [nil,
      "Driver Error",
    "Drop Approved by Credit",
    "Drop Approved by Regional Manager",
    "Returned - Credit in process",
    "Short Paid - Pricing issue - Sales to investigate",
    "Short Paid - Product missing - Credit pending"]
  end
  self.table_name = "dartaccounts"
  before_save :default_completed
  before_update :check_logi_complete
  validates :ship_date, :route_number, :customer_id, :customer, presence: true
  validates :invoice_number, uniqueness: true
  validates :logistics_agent_initials, presence: true, :if => :owed_vs_received
  validates :logistics_agent_initials, :length => {:maximum => 2}, :if => :owed_vs_received
  validate :check_logi_complete, on: :update
  validate :save_completed_dates, on: :update
  validates :reason_code, :inclusion => {:in =>  [nil,
    "",
    "Driver Error",
    "Drop Approved by Credit",
    "Drop Approved by Regional Manager",
    "Returned - Credit in process",
    "Short Paid - Pricing issue - Sales to investigate",
    "Short Paid - Product missing - Credit pending"]}

  def default_completed
    self.logistics_completed ||= false
    self.accounting_completed ||= false
  end

  def owed_vs_received
    return false if !self.amount_received
    return false if self.amount_owed == 0
    return false if self.amount_received == nil
    return (self.amount_owed <=> self.amount_received) <= 0
  end

  def check_logi_complete
    return false if self.amount_received == nil
    rec_ammount = self.amount_received
    owed = self.amount_owed
    self.logistics_completed = rec_ammount >= owed ? true : false
  end

  def save_completed_dates
    date = Date.today
    self.logistics_completed_date = self.logistics_completed == true ? date : nil
    self.accounting_completed_date = self.accounting_completed == true ? date : nil
  end

end
