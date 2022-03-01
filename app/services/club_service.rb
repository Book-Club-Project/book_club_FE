class ClubService
  def self.club(club_id)
    get_data("/api/v1/clubs/#{club_id}")
  end

  def self.club_users(club_id)
    get_data("/api/v1/clubs/#{club_id}/users")
  end

  def self.club_comments(club_id)
    get_data("/api/v1/clubs/#{club_id}/comments")
  end

  def self.club_create(club_params)
    response = conn.post("api/v1/clubs", params: club_params.to_json, headers: {'Content-Type' => 'application/json'})
  end

  private
    def self.conn
      Faraday.new(url: "http://localhost:3000")
    end

    def self.get_data(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
end
