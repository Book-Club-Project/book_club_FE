class CommentService < BackendService
  def self.create_comment(data)
    q = parsed_post_response("/api/v1/comments", data)
  end

  # def self.create_comment(data)
  #   post_data("/api/v1/comments?title=#{data[:title]}&body=#{data[:body]}&user_id=#{data[:user_id]}&club_id=#{data[:club_id]}")
  # end
end
