class UserService < BackendService
  def self.get_user(user_id)
    parsed_response("/api/v1/users/#{user_id}")[:data]
  end

  def self.get_all_users
    parsed_response("/api/v1/users")[:data]
  end

end
