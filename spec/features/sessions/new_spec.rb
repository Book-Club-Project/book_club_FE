require 'rails_helper'

RSpec.describe 'User Login Page', type: :feature do
  describe 'As a visitor to the login page', :vcr do
    before(:each) { visit '/login' }

    scenario 'I see the app name' do
      expect(page).to have_content("The Book Club")
    end

    scenario 'I see the nav bar links' do
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Discover Books', href: '/discover')
      expect(page).to have_link('Login', href: '/login')
      expect(page).to have_link('Register', href: '/register')
    end

    scenario 'I do not see a logout button' do
      expect(page).to_not have_link('Logout')
    end

    xscenario 'I see a random quote' do
      expect(page).to have_css('#random-quote')
    end

    scenario 'I see a form to login a new user' do
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_button('Login')
    end

    scenario 'I see a login option for Google OAuth' do
      expect(page).to have_button('Login with Google')
    end
  end

  describe 'As a logged in user' do
    # I see a logout button
    # I do not see login/register buttons
    # I do not see a form or button to login with google
    # I instead see a message that says "You're already logged in. If you would like to login as a different user, please logout first."
  end
end
