class Comment
  attr_reader :title, :body, :user_id, :club_id
  def initialize(data)
    @title = data[:attributes][:title]
    @body = data[:attributes][:body]
    @user_id = data[:attributes][:user_id]
    @club_id = data[:attributes][:club_id]
  end
end
