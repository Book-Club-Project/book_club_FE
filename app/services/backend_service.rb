class BackendService
  def self.conn
     conn = Faraday.new(url: "http://localhost:3000/")
    # conn = Faraday.new(url: "https://boiling-woodland-43020.herokuapp.com/")
  end

  def self.parsed_response(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
