class UserService < BackendService
  def self.get_user(user_id)
    parsed_response("/api/v1/users/#{user_id}")[:data]
  end
end
