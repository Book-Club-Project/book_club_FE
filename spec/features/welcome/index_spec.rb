require 'rails_helper'

RSpec.describe 'Book Club Landing/Welcome page', type: :feature do
  #As an un-authenticated visitor
  context 'As an unauthenticated visitor to the landing page', :vcr do

    before(:each) { visit '/' }

    scenario 'I am on the root directory' do
      expect(page).to have_current_path('/')
    end

    # Navbar exists on page.
    scenario 'I see the nav bar with links for unauthenticated user' do
      within '#nav-bar' do
        # logo exists and is the image we want
        expect(page.find('#logo')['alt']).to eq('logo')
        expect(page.find('#logo')['src']).to match('logo')

        # link to home exists
        expect(page).to have_selector(:css, 'a[href="/"]')

        # links for unauthenticated user exist
        expect(page).to have_link('Login', href: '/login')
        expect(page).to have_link('Register', href: '/register')

        # links for authenticated users do not exist
        expect(page).to_not have_link('Logout')
        expect(page).to_not have_link('Dashboard')
      end
    end

    context 'Clicking links directs me to the proper page' do
      scenario 'I click the home button' do
        find(:xpath, "//a[@href='/']").click
        expect(page).to have_current_path('/')
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

    scenario 'I see a static quote' do
      expect(page).to have_css('#static-quote')

      within "#static-quote" do
        expect(page).to have_content("You will be the same person in five years as you are today except for the people you meet and the books you read.")
      end
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

    context 'I can see links and content' do
      before { visit '/' }

      scenario 'I am on the landing page' do
        expect(current_path).to eq('/')
      end

      # Navbar exists on page.
      scenario 'I see the nav bar with links for authenticated user' do
        within '#nav-bar' do
          # logo exists and is the image we want
          expect(page.find('#logo')['alt']).to eq('logo')
          expect(page.find('#logo')['src']).to match('logo')

          # link to home exists
          expect(page).to have_selector(:css, 'a[href="/"]')

          # links for unauthenticated user do not exist
          expect(page).to_not have_link('Login', href: '/login')
          expect(page).to_not have_link('Register', href: '/register')

          # links for authenticated user exist
          expect(page).to have_link('Logout')
          expect(page).to have_link('Dashboard')
        end
      end

      context 'Clicking links directs me to the proper page' do
        scenario 'I click the home button' do
          find(:xpath, "//a[@href='/']").click
          expect(page).to have_current_path('/')
        end

        scenario 'I click the dashboard link in nav-bar' do
          within '#nav-bar' do
            click_link 'Dashboard'
            expect(page).to have_current_path('/dashboard')
          end
        end

        scenario 'I click the logout link' do
          click_link 'Logout'
          expect(page).to have_current_path('/')

          expect(page).to_not have_link('Logout')
          expect(page).to_not have_link('Dashboard')
        end
      end

      scenario 'I see a static quote' do
        expect(page).to have_css('#static-quote')

        within "#static-quote" do
          expect(page).to have_content("You will be the same person in five years as you are today except for the people you meet and the books you read.")
        end
      end
    end
  end

  context 'As an unauthenticated visitor I see a search', :vcr do
    before(:each) { visit '/'}

    scenario 'I see a search bar that searches for books by keyword' do
      expect(page).to have_button('Search')

      fill_in :search, with: 'pride'
      click_button 'Search'
      expect(current_path).to eq('/')
      expect(page).to have_content('Pride and Prejudice')
    end

    scenario 'I see a flash message if query returns no results' do
      expect(page).to have_button('Search')

      fill_in :search, with: "jh21g31yiu2g3"
      click_button 'Search'
      expect(current_path).to eq('/')
      expect(page).to have_content("We failed you or this book does not exist")
    end

    scenario 'I see search results are links to the book show page' do
      fill_in :search, with: 'pride'
      click_button 'Search'

      click_link 'Pride and Prejudice'

      expect(current_path).to match('/books/')
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
      before(:each) { visit '/' }

      scenario 'I see a search bar that searches for books by keyword' do
        expect(page).to have_button('Search')

        fill_in :search, with: 'pride'
        click_button 'Search'
        expect(current_path).to eq('/')
        expect(page).to have_content('Pride and Prejudice')
      end

      scenario 'I see a flash message if query returns no results' do
        expect(page).to have_button('Search')

        fill_in :search, with: "jh21g31yiu2g3"
        click_button 'Search'
        expect(current_path).to eq('/')
        expect(page).to have_content("We failed you or this book does not exist")
      end

      scenario 'I see search results are links to the book show page' do
        fill_in :search, with: 'pride'
        click_button 'Search'

        click_link 'Pride and Prejudice'

        expect(current_path).to match('/books/')
      end

      # Skipped to not blow out API rate limit
      xscenario 'I see a random quote' do
        expect(page).to have_css('#random-quote')
      end
    end
  end
end
