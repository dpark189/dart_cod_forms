class AccountsController < ApplicationController
  def index
    @accounts = Account.where(completed: true)
  end

  def update

  end
end
