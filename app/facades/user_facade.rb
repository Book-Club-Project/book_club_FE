class UserFacade

  def self.find_user(user_id)
    user = UserService.get_user(user_id)
    User.new(user)
  end
end
