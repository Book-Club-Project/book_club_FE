class AuthenticationFacade

  def self.authenticate_user_by_email(email, password)
    user = AuthenticationService.authenticate_user_by_email(email, password)

    User.new(user)
  end
end
