require 'rails_helper'

describe 'user dashboard' do
  let!(:user) { User.new({ id: '1', attributes: { email: "my_email@email.com",
                           username: "Book_Worm",
                           password_digest: "seeeecret"
                        }})}

  describe 'display' do
    it 'nav bar links' do
      visit "/dashboard/#{user.id}"
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Discover Books', href: '/discover')
      expect(page).to have_link('Logout', href: '/logout')
    end

    it 'username' do
      visit "/dashboard/#{user.id}"
      expect(page).to have_content("#{user.username}'s Dashboard")
    end

    it 'literary quote' do
      visit "/dashboard/#{user.id}"
      expect(page).to have_css('#random-quote')
    end
  end
end
