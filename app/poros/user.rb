class User
  attr_reader :email,
              :username,
              :password_diget
  def initialize(data)
    @email = data[:email]
    @username = data[:username]
    @password_diget = data[:password_diget]
  end
end
