class CommentFacade
  def self.post_comment(data)
    comment = CommentService.create_comment(data)[:data]
    Comment.new(comment)
  end
end
