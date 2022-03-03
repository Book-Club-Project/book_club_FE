require 'rails_helper'

RSpec.describe 'Users New/Register Page', type: :feature do
  context 'As a visitor to the register page', :vcr do

    before(:each) { visit '/register' }

    scenario 'I see the app name and logo' do
      within "#logo" do
        expect(page).to have_content("The Book Club")
      end
    end

    # Navbar behavior is tested in welcome/index_spec.rb
    scenario 'I see the nav bar links for unauthenticated user' do
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Discover Books', href: '/discover')
      expect(page).to have_link('Login', href: '/login')
      expect(page).to have_link('Register', href: '/register')

      expect(page).to_not have_link('Logout')
      expect(page).to_not have_link('My Dashboard')
    end

    # Skipped to not blow out API rate limit
    xscenario 'I see a random quote' do
      expect(page).to have_css('#random-quote')
    end

    scenario 'I see a form to create a new user' do
      expect(page).to have_field(:name)
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_field(:password_confirmation)
      expect(page).to have_button('Register')
    end

    scenario 'I see a sign-in option for Google OAuth' do
      expect(page).to have_button('Register with Google')
    end
  end

  context 'As a logged in user', :vcr do
    let!(:user) { User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } }) }

    before(:each) do
      OmniAuth.config.test_mode = true

      # Silence CSRF attack warnings
      OmniAuth.config.silence_get_warning = true

      # Mock OAuth user authentication
      OmniAuth.config.add_mock(:google, {:uid => '12345'})
      Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

      # Set current user
      allow_any_instance_of(ApplicationController)
          .to receive(:current_user).and_return(user)

      visit "/auth/google_oauth2"
    end

    context 'Content displays for logged in user' do
      before(:each) { visit '/register' }

      # Navbar behavior is tested in welcome/index_spec.rb
      scenario 'I see the nav bar links for authenticated user' do
        expect(page).to have_link('Home', href: '/')
        expect(page).to have_link('Discover Books', href: '/discover')

        expect(page).to_not have_link('Login', href: '/login')
        expect(page).to_not have_link('Register', href: '/register')

        expect(page).to have_link('Logout')
        expect(page).to have_link('My Dashboard')
      end

      scenario 'I do not see a form to create a new user' do
        expect(page).to_not have_field(:name)
        expect(page).to_not have_field(:email)
        expect(page).to_not have_field(:password)
        expect(page).to_not have_field(:password_confirmation)
        expect(page).to_not have_button('Register')
      end

      scenario 'I do not see a sign-in option for Google OAuth' do
        expect(page).to_not have_button('Register with Google')
      end

      scenario 'I see a message to the user' do
        expect(page).to have_css('#logged-in-user-message')

        within '#logged-in-user-message' do
          expect(page).to have_content('You are already logged in.')
          expect(page).to have_link('Logout', href: '/logout')
        end
      end

      # Skipped to not blow out API rate limit
      xscenario 'I see a random quote' do
        expect(page).to have_css('#random-quote')
      end
    end
  end
end
