require 'rails_helper'

RSpec.describe CommentFacade do
  describe 'class methods' do
    let!(:user) { User.new({ id: '1', attributes: { name: "Raccoon22", email: "happy22@example.com" } }) }

    describe '::post_comment(data)', :vcr do
      it 'creates a comment' do
        data = {:title=>"Test123", :body=>"My comment", :user_id=> user.id, :club_id=> "1"}
        comment = CommentFacade.post_comment(data)

        expect(comment).to be_a Comment
      end
    end
  end
end
