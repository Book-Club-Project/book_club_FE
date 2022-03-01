require 'rails_helper'

RSpec.describe Comment do
    it "exists and has attributes" do
      data = {attributes: {title: 'Hi',
               body: 'Good Book',
               user_id: 1,
               club_id: 1
             }}
      comment = Comment.new(data)
      expect(comment).to be_a(Comment)
      expect(comment.title).to eq('Hi')
      expect(comment.body).to eq('Good Book')
      expect(comment.user_id).to eq(1)
      expect(comment.club_id).to eq(1)
  end
end
