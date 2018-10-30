require 'rails_helper'

RSpec.describe Account, :type => :model do

  describe "Validations" do
    create_test_account

    it "should be valid when amount_received exists and initials are 2 letters" do
      expect(account.update!(amount_received: 1000, logistics_agent_initials: "AA")).to be true
    end

    it "checks for initials when amount_received is valid" do
      expect(account.update(amount_received: 1000)).to be false
    end

    it "checks for initials when received_as_cash_or_check is valid" do
      expect(account.update(amount_received: 1000)).to be false
    end

    it "initials are only valid with 2 characters" do
      expect(account.update(amount_received: 1000, logistics_agent_initials: "AAA")).to be false
    end

  end

  describe "Account completed status is set to false by default" do
    create_test_account
    it "initializes with completed as false" do
      expect(account.logistics_completed).to be(false)
      expect(account.accounting_completed).to be(false)
    end
  end

  describe "When Account instance is updated" do
    create_test_account
    it "should check if the amount_owed >= amount_received" do
      expect(account).to receive(:check_logi_complete)
      account.update_attributes(amount_received: account.amount_owed)
    end

    it "should set logistics_completed to true if owed >= amount_received" do
      account.update_attributes(amount_received: account.amount_owed)
      expect(account.logistics_completed).to be(true)
      
    end
  end


  it { should validate_presence_of(:ship_date) }
  it { should validate_presence_of(:route_number) }
  it { should validate_presence_of(:customer_id) }
  it { should validate_presence_of(:customer) }
end
