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
    before(:each) do
    user = User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } })

    OmniAuth.config.test_mode = true
    OmniAuth.config.add_mock(:google, {:uid => '12345'})
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]

    allow_any_instance_of(ApplicationController)
        .to receive(:current_user).and_return(user)
        visit "/auth/google_oauth2"
    end
    # before(:each) do
    #   visit '/'
    #   #authenticate user before runing tests
    # end

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

      scenario 'logout link' do
        expect(page).to have_link('Logout', href: '/logout')
      end

      scenario 'link to my page' do
        expect(page).to have_link('My Page')
        expect(page).to have_css('#dashboard-link')
      end

      scenario 'I do not see links for unauthenticated visitors' do
        expect(page).to_not have_link('Login')
        expect(page).to_not have_link('Register')
      end
    end

    xscenario 'I see a random quote' do
      expect(page).to have_css('#random-quote')

      within "#random-quote" do
        expect(page).to have_content("Quote of the day!")
      end
    end
  end
end
