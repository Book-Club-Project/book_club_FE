class ClubFacade
  def self.get_club(id)
    club = ClubService.club(id)[:data]
    Club.new(club)
  end

  def self.get_club_users(id)
    users = ClubService.club_users(id)

    users[:data].map do |user|
      User.new(user)
    end
  end

  def self.get_club_comments(id)
    comments = ClubService.club_comments(id)

    comments[:data].map do |comment|
      Comment.new(comment)
    end
  end

  def self.create_club(data)
    club = ClubService.create_club(data)[:data]
    Club.new(club)
  end
end
