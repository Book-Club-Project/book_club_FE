class UserService < BackendService
  def self.get_user(user_id)
    parsed_response("/api/v1/users/#{user_id}")[:data]
  end

  def self.get_user_by_email(user_email)
    parsed_response("/api/v1/users?email=#{user_email}")
  end

end
