require 'rails_helper'

RSpec.describe 'Book Club Landing/Welcome page', type: :feature do
  #As an un-authenticated visitor
  context 'As a visitor to the landing page', :vcr do

    before(:each) { visit '/' }

    scenario 'I am on the root directory' do
      expect(page).to have_current_path('/')
    end

    scenario 'I see a welcome to app message' do
      expect(page).to have_content('Welcome to Book Club')
    end

    scenario 'I see home and discover books links' do
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Discover Books', href: '/discover')
    end

    context 'Different links appear when logged out' do
      scenario 'I see login and register buttons' do
        expect(page).to have_link('Login', href: '/login')
        expect(page).to have_link('Register', href: '/register')
      end

      context 'Clicking links directs me to the proper page' do
        scenario 'I click the home button' do
          click_link 'Home'
          expect(page).to have_current_path('/')
        end

        scenario 'I click the discover books link' do
          click_link 'Discover Books'
          expect(page).to have_current_path('/discover')
        end

        scenario 'I click the register link' do
          click_link 'Register'
          expect(page).to have_current_path('/register')
        end

        scenario 'I click the login link' do
          click_link 'Login'
          expect(page).to have_current_path('/login')
        end
      end

      scenario 'I do not see logout and my dashboard links' do
        expect(page).to_not have_link('Logout')
        expect(page).to_not have_link('My Dashboard')
        expect(page).to_not have_css('#dashboard-link')
      end
    end

    scenario 'I see a static quote' do
      expect(page).to have_css('#static-quote')

      within "#static-quote" do
        expect(page).to have_content("You will be the same person in five years as you are today except for the people you meet and the books you read.")
      end
    end

    scenario 'I see the app logo' do
      expect(page).to have_css("#logo")
    end
  end

  #As an authenticated visitor
  context 'As a logged in user visiting the landing page', :vcr do
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

    scenario 'I am on the root directory and see global links' do
      visit '/'
      expect(page).to have_current_path('/')
      expect(page).to have_content('Welcome to Book Club')
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Discover Books', href: '/discover')
    end

    context 'Different links appear when logged in' do
      before(:each) { visit '/' }

      scenario 'I see logout and dashboard links' do
        expect(page).to have_link('Logout', href: '/logout')
        expect(page).to have_link('My Dashboard')
        expect(page).to have_css('#dashboard-link')
      end

      scenario 'I do not see login and register links' do
        expect(page).to_not have_link('Login')
        expect(page).to_not have_link('Register')
      end
    end

    context 'Clicking links directs me to the proper page' do
      before(:each) { visit '/' }

      scenario 'I click the home button' do
        click_link 'Home'
        expect(page).to have_current_path('/')
      end

      scenario 'I click the discover books link' do
        click_link 'Discover Books'
        expect(page).to have_current_path('/discover')
      end

      scenario 'I click the dashboard link' do
        click_link 'My Dashboard'
        expect(page).to have_current_path('/dashboard')
      end

      scenario 'I click the logout link' do
        click_link 'Logout'
        expect(page).to have_current_path('/')
      end
    end

    scenario 'I see a static quote' do
      visit '/'
      
      expect(page).to have_css('#static-quote')

      within "#static-quote" do
        expect(page).to have_content("You will be the same person in five years as you are today except for the people you meet and the books you read.")
      end
    end
  end
end
