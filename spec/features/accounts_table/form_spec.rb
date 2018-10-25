require 'rails_helper'

feature 'Account Form' do
  create_accounting_and_logistics_users
  scenario "Multiple accounts from different dates that all incomplete" do
    date = "10/25/2018"
    login_user(a_user)
    create_accounts_different_dates

    Account.last.update_attributes(completed: true)
    visit_accounts_index_for_date(date)
    expect(page).to have_content("10/24/2018")
    expect(page).to have_content("10/25/2018")
  end

  scenario "Multiple accounts but the one with different date is completed" do

    date = "10/24/2018"
    login_user(a_user)
    create_accounts_different_dates
    Account.last.update_attributes(completed: true)
    visit_accounts_index_for_date(date)

    save_and_open_page
    expect(page).to have_content("10/24/2018")
    expect(page).to_not have_content("10/25/2018")
  end
end
