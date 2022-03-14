require 'rails_helper'

RSpec.describe 'Books Show Page' do
  context 'As a visitor to the page', :vcr do
    # Visits book show page and displays info for Pride and Prejudice
    before(:each) { visit "/books/gwgON2IwgDUC" }

    # Navbar exists on page. Explicit behavior is tested in welcome/index_spec.rb
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

    scenario 'I see the book details for Pride and Prejudice' do
      expect(page).to have_content('Pride and Prejudice')
      expect(page).to have_content('Jane Austen')
      expect(page).to have_content('Fiction / Classics')
      expect(page.find('#book-cover')['alt']).to eq('book cover')
      expect(page).to have_content('Summary')
      expect(page).to have_content('Book rating')
    end

    scenario 'I see a message to login before creating a book club' do
      within '#create-club-button' do
        expect(page).to have_content('To start a club with this book, please')
        expect(page).to have_link('Login', href: '/login')
      end
    end

    scenario 'I do not see a button to make a book club' do
      expect(page).to_not have_button('Create Book Club')
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
      before(:each) { visit '/books/gwgON2IwgDUC' }

      # Navbar exists on page. Explicit behavior is tested in welcome/index_spec.rb
      scenario 'I see the nav bar with links for unauthenticated user' do
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

      scenario 'I see button to create club and no message to log in' do
        within '#create-club-button' do
          expect(page).to have_button('Create Book Club')
          expect(page).to_not have_link('Login', href: '/login')
        end
      end

      scenario 'I see the book details for Pride and Prejudice' do
        expect(page).to have_content('Pride and Prejudice')
        expect(page).to have_content('Jane Austen')
        expect(page).to have_content('Fiction / Classics')
        expect(page.find('#book-cover')['alt']).to eq('book cover')
        expect(page).to have_content('Summary')
        expect(page).to have_content('Book rating')
      end

      scenario 'I click create club button and am taken to a form to create new club' do
        within '#create-club-button' do
          click_button 'Create Book Club'
          expect(current_path).to match('/clubs/new')
        end
      end
    end
  end
end
