require 'rails_helper'

RSpec.describe 'Users New/Register Page', type: :feature do
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
      expect(page).to have_button('Register')
    end

    scenario 'I see a sign in option for Google OAuth' do
      expect(page).to have_button('Register with Google')
    end
  end

  # Tests for logged in user
  describe 'As a logged in user', :vcr do
    let!(:user) { User.new({ id: '1', attributes: { email: 'user@email.com', username: 'user', password_digest: 'xyz' } }) }

    before(:each) do
      # allow(UserFacade).to receive(:find_user).with(anything).and_return(user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:google, {:uid => '12345'})
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

      visit '/auth/google_oauth2/'
      #authenticate user before runing tests
    end

    context 'I see different links' do
      scenario 'I see a Home link' do
        expect(page).to have_link('Home', href: '/')
        click_link 'Home'
        expect(page).to have_current_path('/')
      end

      scenario 'I see a Discover books link' do
        expect(page).to have_link('Discover Books', href: '/discover')
        click_link 'Discover Books'
        expect(page).to have_current_path('/discover')
      end

      scenario 'I see links for logged in user have taken place of those for logged out user' do
        visit '/register'
        # click_button 'Register with Google'
        expect(page).to have_link('Logout')
        # expect(page).to have_link('My Dashboard')
        # expect(page).to have_css('#dashboard-link')

        #doesn't have
        expect(page).to_not have_link('Login')
        expect(page).to_not have_link('Register')
        # expect(page).to_not have_field(:name)
        # expect(page).to_not have_field(:email)
        # expect(page).to_not have_field(:password)
        # expect(page).to_not have_field(:password_confirmation)
        # expect(page).to_not have_button('Register')
      end
    end

    # I do not see a form or button to register with google
    # I instead see a message that says "You're already logged in. If you would like to register a new user, please logout first."
  end

end
