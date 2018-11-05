class StaticPagesController < ApplicationController
  def root
    render :root
  end

  def accounts_by_date
    if date_params[:date] != "" && date_params[:location] != ""
      acc_arr = fetch_records(date_params[:location], date_params[:date])
      acc_arr.each do |acc|
        if !Account.find_by(invoice_number: acc["invoice_numb"])
          debugger
          Account.create(location: acc["cost_ctr"].downcase,
          customer_id: acc["cust_code"],
          customer: acc["cust_name"],
          invoice_number: acc["invoice_numb"],
          route_number: acc["route_code"],
          amount_owed: acc["Total"],
          ship_date: acc["ship_date"]
          )
        end
      end
      redirect_to controller: 'accounts', action: 'index', account_attr: date_params
    else
      flash[:alert] = "Please fill in both fields with valid inputs"
      redirect_to controller: 'static_pages', action: "root"
    end
  end

  private

  def date_params
    params.require(:static_pages).permit(:date, :location)
  end
end
