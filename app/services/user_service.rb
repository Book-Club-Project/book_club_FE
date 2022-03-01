class UserService
  def self.conn
    conn = Faraday.new(url: "http://localhost:3000")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_user(user_id)
    parsed_response("/api/v1/users/#{user_id}")
  end

  def self.post_user(user_params)
    response = conn.post('/api/v1/users', user_params.to_json, 'Content-Type' => 'application/json')
    JSON.parse(response.body, symbolize_names: true)
  end
end
