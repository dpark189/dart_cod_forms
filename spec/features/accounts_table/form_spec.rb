require 'rails_helper'

feature 'Account Form' do
  create_accounting_and_logistics_users
  scenario "Multiple accounts from different dates that are incomplete" do
    date = "10/25/2018"
    login_user(a_user)
    create_accounts_different_dates
    visit_accounts_index_for_date(date, "nj")
    expect(page).to have_content("10/24/2018")
    expect(page).to have_content("10/25/2018")
  end

  scenario "Multiple accounts but the one with different date is completed" do

    date = "10/24/2018"
    login_user(a_user)
    create_accounts_different_dates
    Account.last.update_attributes(completed: true)
    visit_accounts_index_for_date(date, "nj")
    expect(page).to have_content("10/24/2018")
    expect(page).to_not have_content("10/25/2018")
  end

  scenario "Marking account as complete" do
    date = "10/24/2018"
    login_user(a_user)
    create_test_account1
    account = Account.first
    visit_accounts_index_for_date(date, "nj")
    find(:css, ".completed").set(true)

    find(:css, ".amount_received").set("#{account.amount_owed}")

    find(:css, ".received_as_cash_or_check").set("#{account.amount_owed}")

    find(:css, ".logistics_agent_initials").set("AD")

    find(:css, ".reason_details").set("asdf")

    click_button("Submit")
    expect(page).to_not have_content("#{account.customer_id}")
  end
end
