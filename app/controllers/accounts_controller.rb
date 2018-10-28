class AccountsController < ApplicationController
  def index
    @completed_filter = params[:completed] == "all" ? nil : params[:completed] == "false" || params[:completed] == nil ? false : true

    @accounts = Account.where("(ship_date = ? and completed = ? and location = ?) or completed = ?", params[:account_attr][:date], false, params[:account_attr][:location].downcase, false)

    @accounts = @accounts.sort_by{|account| [ account.ship_date == params[:account_attr][:date] ? 0 : 1] }
    @secondary_attr = [
      "credit",
      "id",
    ]
  end

  def update
    @account = Account.find(params[:id])
    param_copy = account_params
    if param_copy[:logistics_agent_initials]
      param_copy[:logistics_agent_initials] = param_copy[:logistics_agent_initials].downcase
    end
    param_copy[:completed] = account_params[:completed] == "true" ? true : false
    if @account.update_attributes(param_copy)
      redirect_to controller: 'accounts', action: 'index', date: { date: params[:account_attr][:date] }, location: { location: params[:account_attr][:location] }
    else
      flash.now[:alert] = @account.errors.full_messages
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
