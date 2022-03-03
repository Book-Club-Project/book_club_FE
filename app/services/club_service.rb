class ClubService < BackendService
  def self.club(club_id)
    parsed_response("/api/v1/clubs/#{club_id}")
  end

  def self.club_users(club_id)
    parsed_response("/api/v1/clubs/#{club_id}/users")
  end

  def self.club_comments(club_id)
    parsed_response("/api/v1/clubs/#{club_id}/comments")
  end
end
