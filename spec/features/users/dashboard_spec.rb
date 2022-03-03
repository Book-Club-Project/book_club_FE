require 'rails_helper'

describe 'user dashboard' do
  before do
    data = {attributes: {email: "my_email@email.com",
            username: "Book_Worm",
            password_digest: "seeeecret"
          }}

    user = User.new(data)
    visit dashboard_path(user)
  end

  describe 'display' do
    it 'nav bar links' do
      expect(page).to have_link('Home', href: '/')
      expect(page).to have_link('Discover Books', href: '/discover')
      expect(page).to have_link('Logout', href: '/logout')
    end

    it 'username' do
      expect(page).to have_content("#{@user}'s Dashboard")
    end

    it 'literary quote' do
      expect(page).to have_css('#random-quote')
    end


    it 'button to Create New Book Club' do
      click_on 'Create New Book Club'
      expect(current_path).to eq('/registerclub')
    end

    scenario 'book shelf' do
      it 'lists a users books' do
        expect(page).to have_css('#book_container')
      end

      it 'book name links to show page' do
        #to test, add books to user
      end
    end
  end
end
