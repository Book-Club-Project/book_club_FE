class UserFacade

  def self.find_user(user_id)
    user = UserService.get_user(user_id)
    User.new(user)
  end

  def self.find_user_by_email(user_email)
    user = UserService.get_user_by_email(user_email)
    User.new(user)
  end
end
