class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :is_datetime, :fetch_records

  def is_datetime(d)
    d.methods.include? :strftime
  end

  def fetch_records(cost_ctr, date)
    column_query = "SELECT
      a.cost_ctr,
      a.cust_code,
      a.cust_name,
      b.invoice_numb,
      b.ship_date,
      a.route_code,
      round(b.sub_total + b.charged_frt,2) AS Total,
      b.sub_total + b.charged_frt AS Tot_Org,
      a.order_terms
    FROM
      ordhead a, invheadview b
    WHERE a.order_numb = b.order_numb AND a.rel_numb = b.rel_numb AND order_terms LIKE 'COD%'
    AND a.cost_ctr = '#{cost_ctr}' AND b.ship_date = '#{date}'"

    client = TinyTds::Client.new username: "intranet", password: "Duck600it", adapter: "sqlserver", host: "sqlserver01", database: "e21prod"
    result = client.execute("#{column_query}")
    arr = []
    result.each do |row|
      arr << row
    end
    return arr
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
