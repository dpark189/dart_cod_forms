class ReportsController < ApplicationController
  def index
    @accounts = Account.where("ship_date = ? and location = ?", params[:account_attr][:date], params[:account_attr][:location].downcase)

    @accounts = @accounts.sort_by{|account| [ (account.ship_date == params[:account_attr][:date] ? 0 : 1), account.route_number ] }
    @accepted_fields = [
      "ship_date",
      "invoice_number",
      "route_number",
      "customer_id",
      "customer",
      "amount_owed",
      "extra",
      "amount_received"
    ]
  end
end
