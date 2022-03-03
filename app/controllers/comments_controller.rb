class CommentsController < ApplicationController
  def create
     comment = CommentFacade.post_comment(title: params[:title], body: params[:body], user_id: params[:user_id], club_id: params[:club_id])
     redirect_to "/clubs/#{params[:club_id]}"
  end
end
