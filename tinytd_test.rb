# def sample_query
#   arr = [{"cost_ctr"=>"NJ",
#   "cust_code"=>"JACKMDMD",
#   "cust_name"=>"JACKIES",
#   "invoice_numb"=>"1102044",
#   "ship_date"=>2015-01-26 00:00:00 -0500,
#   "route_code"=>"51",
#   "Total"=>3674.3,
#   "Tot_Org"=>3674.2999999999997,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"MAGRVAVA",
#   "cust_name"=>"THE MAGPIE",
#   "invoice_numb"=>"1102746",
#   "ship_date"=>2015-01-28 00:00:00 -0500,
#   "route_code"=>"54",
#   "Total"=>470.19,
#   "Tot_Org"=>470.19,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"COMPDCDC",
#   "cust_name"=>"COMPASS ROSE",
#   "invoice_numb"=>"1102728",
#   "ship_date"=>2015-01-28 00:00:00 -0500,
#   "route_code"=>"53",
#   "Total"=>18.3,
#   "Tot_Org"=>18.3,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"UNUMDCDC",
#   "cust_name"=>"UNUM RESTAURANT",
#   "invoice_numb"=>"1102021",
#   "ship_date"=>2015-01-26 00:00:00 -0500,
#   "route_code"=>"50",
#   "Total"=>362.81,
#   "Tot_Org"=>362.81,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"POUROTNY",
#   "cust_name"=>"POULET ROTI",
#   "invoice_numb"=>"1106098",
#   "ship_date"=>2015-02-02 00:00:00 -0500,
#   "route_code"=>"11",
#   "Total"=>243.04,
#   "Tot_Org"=>243.04,
#   "order_terms"=>"CODC"},
#   {"cost_ctr"=>"NJ",
#   "cust_code"=>"JACKMDMD",
#   "cust_name"=>"JACKIES",
#   "invoice_numb"=>"1102044",
#   "ship_date"=>2015-01-26 00:00:00 -0500,
#   "route_code"=>"51",
#   "Total"=>3674.3,
#   "Tot_Org"=>3674.2999999999997,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"MAGRVAVA",
#   "cust_name"=>"THE MAGPIE",
#   "invoice_numb"=>"1102746",
#   "ship_date"=>2015-01-28 00:00:00 -0500,
#   "route_code"=>"54",
#   "Total"=>470.19,
#   "Tot_Org"=>470.19,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"COMPDCDC",
#   "cust_name"=>"COMPASS ROSE",
#   "invoice_numb"=>"1102728",
#   "ship_date"=>2015-01-28 00:00:00 -0500,
#   "route_code"=>"53",
#   "Total"=>18.3,
#   "Tot_Org"=>18.3,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"UNUMDCDC",
#   "cust_name"=>"UNUM RESTAURANT",
#   "invoice_numb"=>"1102021",
#   "ship_date"=>2015-01-26 00:00:00 -0500,
#   "route_code"=>"50",
#   "Total"=>362.81,
#   "Tot_Org"=>362.81,
#   "order_terms"=>"CODC"},
#  {"cost_ctr"=>"NJ",
#   "cust_code"=>"POUROTNY",
#   "cust_name"=>"POULET ROTI",
#   "invoice_numb"=>"1106098",
#   "ship_date"=>2015-02-02 00:00:00 -0500,
#   "route_code"=>"11",
#   "Total"=>243.04,
#   "Tot_Org"=>243.04,
#   "order_terms"=>"CODC"},
#   {"cost_ctr"=>"NJ",
#    "cust_code"=>"THEPURNY",
#    "cust_name"=>"THE PURPLE ELEPHANT",
#    "invoice_numb"=>"1105346",
#    "ship_date"=>2015-01-31 00:00:00 -0500,
#    "route_code"=>"12",
#    "Total"=>360.64,
#    "Tot_Org"=>360.64,
#    "order_terms"=>"CODC"}]
#    return arr
# end

def query_test
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
  WHERE a.order_numb = b.order_numb AND a.rel_numb = b.rel_numb AND order_terms LIKE 'COD%'"

  client = TinyTds::Client.new username: "#{Rails.application.credentials.sqlserver[:username]}", password: "#{Rails.application.credentials.sqlserver[:password]}", adapter: "sqlserver", host: "sqlserver01", database: "e21prod"
  result = client.execute("#{column_query}")
  arr = []
  result.each do |row|
    arr << row
  end
  return arr
end

def prod_client
  client = TinyTds::Client.new username: "intranet", password: "Duck600it", adapter: "sqlserver", host: "sqlserver01", database: "e21prod"
  return client
end

def table_names(client)
  result = client.execute("SELECT * FROM INFORMATION_SCHEMA.TABLES")
  arr = []
  result.each do |row|
    arr << row["TABLE_NAME"]
  end
  return arr
end
