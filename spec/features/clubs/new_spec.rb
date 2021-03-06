require 'rails_helper'

RSpec.describe "New club page" do
  context 'As an authenticated user', :vcr do
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

    context 'Content displays for authenticated user' do
      before(:each) do
        visit '/books/gwgON2IwgDUC'
        click_button "Create Book Club"
      end

      scenario 'I am on the create club page' do
        expect(current_path).to eq("/clubs/new")
      end

      # Navbar exists on page. Navbar behavior is tested in welcome/index_spec.rb
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

      # Skipped to not blow out API rate limit
      scenario 'I see a random quote' do
        expect(page).to have_css('#random-quote')
      end

      scenario 'I see a form to create a book club' do
        expect(page).to have_field(:name)
        expect(page).to have_content('Invite Users?')
        expect(page).to have_css('#select-user-1')
        expect(page).to have_button('Create Book Club')
      end

      scenario "I can fill in information and create a new club" do
        within '#form' do
          fill_in :name, with: "Hello123"
          click_button "Create Book Club"
        end

        expect(current_path).to match('/clubs/')
      end
    end
  end
end
