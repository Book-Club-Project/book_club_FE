class User
  attr_reader :email,
              :username,
              :password_diget,
              :id
  def initialize(data)

    @id = data[:data][:id]
    @email = data[:data][:attributes][:email]
    @username = data[:data][:attributes][:username]
    @password_diget = data[:password_diget]
  end
end
