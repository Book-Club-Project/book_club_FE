require 'rails_helper'

describe 'user dashboard' do
  let!(:user) {{ id: '1', attributes: { email: "my_email@email.com",
                           username: "my_email@email.com",
                           password_digest: "seeeecret"
                        }}}

  describe 'display', :vcr do
    before do
      def login
        Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
        visit root_path
        click_on 'Login'
        click_on 'Login with Google'
      end

      login
    end

    it 'nav bar links' do
      visit "/dashboard"
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Discover Books', href: '/discover')
      expect(page).to have_link('Logout', href: '/logout')
    end

    it 'username' do
      visit "/dashboard"
      expect(page).to have_content("#{user[:email]}'s Dashboard")
    end

    it 'literary quote' do
      visit "/dashboard"
      expect(page).to have_css('#random-quote')
    end
  end
end
