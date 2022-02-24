require 'rails_helper'

RSpec.describe User do
  it 'exists with attributes' do
    data = {email: "my_email@email.com",
            username: "Book_Worm",
            password_diget: "seeeecret"
          }
    book = User.new(data)
    expect(book).to be_a(User)
    expect(book.email).to eq("my_email@email.com")
    expect(book.username).to eq("Book_Worm")
    expect(book.password_diget).to eq("seeeecret")
  end
end
