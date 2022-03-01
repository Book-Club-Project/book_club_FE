class User
  attr_reader :email,
              :username,
              :password_digest
  def initialize(data)

    @email = data[:attributes][:email]
    @username = data[:attributes][:username]
    @password_digest = data[:attributes][:password_digest]

#     @email = data[:email]
#     @username = data[:username]
#     @password_digest = data[:password_digest]

  end
end
