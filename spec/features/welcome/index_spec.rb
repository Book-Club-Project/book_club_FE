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
      expect(page).to_not have_link('My Dashboard')
      expect(page).to_not have_css('#dashboard-link')
    end
  end

  #As an authenticated visitor
  xcontext 'As a logged in user visiting the landing page' do

    before(:each) do
      visit '/login'

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

      scenario 'logout link' do
        expect(page).to have_link('Logout', href: '/logout')
      end

      scenario 'link to my page' do
        expect(page).to have_link('My Dashboard')
        expect(page).to have_css('#dashboard-link')
      end

      scenario 'I do not see links for unauthenticated visitors' do
        expect(page).to_not have_link('Login')
        expect(page).to_not have_link('Register')
      end
    end

    scenario 'I see a static quote' do
      expect(page).to have_css('#static-quote')
    end
  end
end
