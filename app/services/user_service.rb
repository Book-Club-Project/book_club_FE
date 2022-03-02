class UserService
  def self.conn
    conn = Faraday.new(url: "http://localhost:3000")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.get_user(user_id)
    parsed_response("/api/v1/users/#{user_id}")
  end

  def self.get_user_by_email(user_email)
    parsed_response("/api/v1/users?email=#{user_email}")
  end

end
