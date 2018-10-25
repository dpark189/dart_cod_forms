require 'rails_helper'

feature 'Navigating to the index page' do
  create_accounting_and_logistics_users

  scenario 'requires sign in' do
    visit "/"
    expect(page).to have_content('Log in')
  end

  scenario 'Successfully signing in' do
    visit "/"
    login_user(a_user)
    expect(page).to have_content('Select Shipping Date')
  end

  scenario 'Unseccessfully signing in' do
    visit "/"
    click_button "Log in"
    expect(page).to have_content('Invalid Login or password')
  end

  scenario "Enter date after successful log in as logistics" do
    date = "10/25/2018"
    login_user(l_user)
    create_accounts_different_dates
    Account.last.update_attributes(completed: true)
    visit_accounts_index_for_date(date)
    expect(page).to_not have_content("Amount Credit")
  end

  scenario "Enter date after successful log in as accounting" do
    date = "10/25/2018"
    login_user(a_user)
    create_accounts_different_dates
    Account.last.update_attributes(completed: true)
    visit_accounts_index_for_date(date)
    expect(page).to have_content("Amount Credit")
  end
end
