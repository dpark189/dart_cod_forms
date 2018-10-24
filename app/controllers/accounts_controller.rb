class AccountsController < ApplicationController
  def index
    @accounts = Account.where(completed: false)
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
