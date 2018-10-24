class AccountsController < ApplicationController
  def index
    @accounts = Account.where(completed: false)
    @secondary_attr = [
      "credit",
      "id",
    ]
  end

  def update

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
