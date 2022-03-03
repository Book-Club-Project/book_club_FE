class User
  attr_reader :id,
              :email,
              :username,
              :password_digest
              
  def initialize(data)
    @id = data[:id]
    @email = data[:attributes][:email]
    @username = data[:attributes][:username]
    @password_digest = data[:attributes][:password_digest]
  end
end
