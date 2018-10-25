class AccountsController < ApplicationController
  def index
    @completed_filter = params[:completed] == "all" ? nil : params[:completed] == "false" || params[:completed] == nil ? false : true
    puts "completed: #{@completed_filter}"
    @accounts = @completed_filter == nil ? Account.where(ship_date: params[:date][:date]) : Account.where(ship_date: params[:date][:date]).where(completed: @completed_filter)
    @accounts = @accounts.sort_by{|account| account.ship_date}
    @secondary_attr = [
      "credit",
      "id",
    ]
  end

  def update
    @account = Account.find(params[:id])
    param_copy = account_params
    param_copy[:completed] = account_params[:completed] == "true" ? true : false
    if @account.update_attributes(param_copy)
      redirect_to accounts_path
    else
      flash.now[:errors] = @account.errors.full_messages
      render :index
    end
  end

  private

  def account_params
    params.require(:account).permit(:amount_received, :amount_credit,
    :received_as_cash_or_check,
    :logistics_agent_initials,
    :reason_code,
    :reason_details,
    :credit,
    :completed)
  end
end
