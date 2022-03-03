class BackendService
  def self.conn
    conn = Faraday.new(url: "http://localhost:3000/")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.parsed_post_response(url, data)
    response = conn.post(url) do |req|
      req.body = {club: data}
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
