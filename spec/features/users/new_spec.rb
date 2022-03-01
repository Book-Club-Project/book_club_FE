require 'rails_helper'

RSpec.describe 'Users New/Register Page' do
  describe 'As a visitor to the register page', :vcr do
    before(:each) { visit '/register' }
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

    scenario 'I see a random quote' do
      expect(page).to have_css('#random-quote')
    end

    scenario 'I see a form to create a new user' do
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_field(:password_confirmation)
      expect(page).to have_button('Submit')
    end

    scenario 'I see a sign in option for Google OAuth' do
      expect(page).to have_button('Sign up with Google')
    end
  end



end
