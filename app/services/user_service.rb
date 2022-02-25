class UserService
  def self.conn
    conn = Faraday.new(url: "http://localhost:3000")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_user(user_id)
    parsed_response
  end

  def post_user(user_params)
    parsed_response
  end
end
