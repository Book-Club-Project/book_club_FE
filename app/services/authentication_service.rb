class AuthenticationService

  def self.conn
    conn = Faraday.new(url: "http://localhost:3000")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:data]
  end

  def self.authenticate_user_by_email(email, password)
    parsed_response("/api/v1/authenticate?email=#{email}&password=#{password}")
  end
end
