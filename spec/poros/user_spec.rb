require 'rails_helper'

RSpec.describe User do
  it 'exists with attributes' do
    data = {email: "my_email@email.com",
            username: "Book_Worm",
            password_diget: "seeeecret"
          }
    user = User.new(data)
    expect(user).to be_a(User)
    expect(user.email).to eq("my_email@email.com")
    expect(user.username).to eq("Book_Worm")
    expect(user.password_diget).to eq("seeeecret")
  end
end
