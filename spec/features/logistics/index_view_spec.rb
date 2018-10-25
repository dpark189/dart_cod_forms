require 'rails_helper'

feature 'Creating a task' do
  create_accounting_and_logistics_users
  scenario 'requires sign in' do
    visit root_path
    expect(page).to have_content('Log in')
  end

  scenario 'Successfully signing in' do
    visit root_path
    login_user(a_user)
    expect(page).to have_content('Accounts')
  end

  scenario 'Unseccessfully signing in' do
    visit root_path
    click_button "Log in"
    expect(page).to have_content('Invalid Login or password')
  end

end
