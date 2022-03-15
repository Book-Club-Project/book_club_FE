require 'rails_helper'

RSpec.describe 'Books Discover/Index' do
  context 'As an unauthenticated visitor', :vcr do
    before(:each) { visit '/discover'}

    scenario 'I see a search bar that searches for books by keyword' do
      expect(page).to have_button('Search')

      fill_in :search, with: 'pride'
      click_button 'Search'
      expect(current_path).to eq('/discover')
      expect(page).to have_content('Pride and Prejudice')
    end

    scenario 'I see a flash message if query returns no results' do
      expect(page).to have_button('Search')
      # binding.pry
      fill_in :search, with: "jh21g31yiu2g3"
      click_button 'Search'
      expect(current_path).to eq('/discover')
      expect(page).to have_content("We failed you or this book does not exist")
    end

    scenario 'I see search results are links to the book show page' do
      fill_in :search, with: 'pride'
      click_button 'Search'

      click_link 'Pride and Prejudice'

      expect(current_path).to match('/books/')
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
  end

  context 'As an authenticated user' do
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

    context 'Content displays for logged in user', :vcr do
      before(:each) { visit '/discover' }

      scenario 'I see a search bar that searches for books by keyword' do
        expect(page).to have_button('Search')

        fill_in :search, with: 'pride'
        click_button 'Search'
        expect(current_path).to eq('/discover')
        expect(page).to have_content('Pride and Prejudice')
      end

      scenario 'I see a flash message if query returns no results' do
        expect(page).to have_button('Search')

        fill_in :search, with: "jh21g31yiu2g3"
        click_button 'Search'
        expect(current_path).to eq('/discover')
        expect(page).to have_content("We failed you or this book does not exist")
      end

      scenario 'I see search results are links to the book show page' do
        fill_in :search, with: 'pride'
        click_button 'Search'

        click_link 'Pride and Prejudice'

        expect(current_path).to match('/books/')
      end

      # Navbar behavior is tested in welcome/index_spec.rb
      scenario 'I see the nav bar links for authenticated user' do
        expect(page).to have_link('Home', href: '/')
        expect(page).to have_link('Discover Books', href: '/discover')

        expect(page).to_not have_link('Login', href: '/login')
        expect(page).to_not have_link('Register', href: '/register')

        expect(page).to have_link('Logout')
        expect(page).to have_link('My Dashboard')
      end

      # Skipped to not blow out API rate limit
      xscenario 'I see a random quote' do
        expect(page).to have_css('#random-quote')
      end
    end
  end
end
