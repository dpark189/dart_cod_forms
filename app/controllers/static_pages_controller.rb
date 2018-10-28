class StaticPagesController < ApplicationController
  def root
    render :root
  end

  def accounts_by_date
    if date_params[:date] != "" && date_params[:location] != ""
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
