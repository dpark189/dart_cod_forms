class AccountsController < ApplicationController
  def index
    @user_role = current_user.role
    @completed_filter = params[:completed] == "all" ? nil : params[:completed] == "false" || params[:completed] == nil ? false : true
    type_completed = current_user.role == "accounting" ? "accounting_completed" : "logistics_completed"
    @accounts = Account.where("(ship_date = ? and #{type_completed} = ? and location = ?) or #{type_completed} = ?", params[:account_attr][:date], false, params[:account_attr][:location].downcase, false)

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
    if current_user.role == "accounting"
      param_copy[:accounting_completed] = account_params[:accounting_completed] == "true" ? true : false
    end
    if @account.update_attributes(param_copy)
      redirect_to controller: 'accounts', action: 'index', account_attr: { date: params[:date], location: params[:location] }
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
    :logistics_completed,
    :accounting_completed
  )
  end
end
