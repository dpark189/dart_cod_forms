class AccountsController < ApplicationController
  def index
    @completed_filter = params[:completed] == "all" ? nil : params[:completed] == "false" || params[:completed] == nil ? false : true
    puts "completed: #{@completed_filter}"
    @accounts = Account.where("(ship_date = ? and completed = ?) or completed = ?", params[:date][:date], false, false)

    @accounts = @accounts.sort_by{|account| [ account.ship_date == params[:date][:date] ? 0 : 1] }
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
      redirect_to controller: 'accounts', action: 'index', date: { date: params[:date] }
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
