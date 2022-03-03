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

    context 'I see links' do
      scenario 'home link' do
        expect(page).to have_link('Home', href: '/')
        click_link 'Home'
        expect(page).to have_current_path('/')
      end

      scenario 'discover books link' do
        expect(page).to have_link('Discover Books', href: '/discover')
        click_link 'Discover Books'
        expect(page).to have_current_path('/discover')
      end

      scenario 'login and register links' do
        expect(page).to have_link('Login', href: '/login')
        expect(page).to have_link('Register', href: '/register')
      end
    end

    scenario 'I see a static quote' do
      expect(page).to have_css('#static-quote')
    end

    scenario 'I do not see links for logged in users' do
      expect(page).to_not have_link('Logout')
      expect(page).to_not have_link('My Page')
      expect(page).to_not have_css('#dashboard-link')
    end
  end

  #As an authenticated visitor
  context 'As a logged in user visiting the landing page', :vcr do
    let!(:user) { User.new({ id: '1', attributes: { email: 'user@email.com', username: 'user', password_digest: 'xyz' } }) }

    before(:each) do
      allow(UserFacade).to receive(:find_user).with(anything).and_return(user)
      visit '/'
      # OmniAuth.config.test_mode = true
      # OmniAuth.config.add_mock(:google, {:uid => '12345'})
      # Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]


      #authenticate user before runing tests
    end

    scenario 'I am on the root directory' do
      expect(page).to have_current_path('/')
    end

    scenario 'I see a welcome to app message' do
      expect(page).to have_content('Welcome to Book Club')
    end

    context 'I see links' do
      scenario 'home link' do
        expect(page).to have_link('Home', href: '/')
        click_link 'Home'
        expect(page).to have_current_path('/')
      end

      scenario 'discover books link' do
        expect(page).to have_link('Discover Books', href: '/discover')
        click_link 'Discover Books'
        expect(page).to have_current_path('/discover')
      end

      scenario 'I see links for logged in user have taken place of those for logged out user' do
        # click_link 'Register'
        # click_button 'Register with Google'
        require "pry"; binding.pry
        save_and_open_page
        expect(page).to have_link('Logout')
        expect(page).to have_link('My Dashboard')
        expect(page).to have_css('#dashboard-link')
        expect(page).to_not have_link('Login')
        expect(page).to_not have_link('Register')
      end
    end

    scenario 'I see a static quote' do
      expect(page).to have_css('#static-quote')
    end
  end
end
