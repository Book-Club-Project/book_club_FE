class UserFacade

  def self.find_user(user_id)
    user = UserService.get_user(user_id)
    User.new(user)
  end

  def self.all_users
    users = UserService.get_all_users

    users.map do |user|
      User.new(user)
    end
  end

  def self.user_clubs(user_id)
    clubs = UserService.user_clubs(user_id)

    clubs.map do |club|
     Club.new(club)
    end
  end
end
