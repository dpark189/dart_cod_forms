class StaticPagesController < ApplicationController
  def root
    render :root
  end

  def accounts_by_date
    redirect_to controller: 'accounts', action: 'index', date: date_params
  end

  private

  def date_params
    params.require(:static_pages).permit(:date)
  end
end
