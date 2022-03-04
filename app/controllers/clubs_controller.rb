class ClubsController < ApplicationController

  def show
    club_host = current_user
    club_id = params[:id]
    @club = ClubFacade.get_club(club_id)
    @club_users = ClubFacade.get_club_users(club_id)
    @book_id = @club.book_id
    @book = BookFacade.book_show(@book_id)
    @comments = ClubFacade.get_club_comments(club_id)
  end

  def new
    @book_id = params[:book_id]
    @users = UserFacade.all_users
  end

  def create
    if params[:user_ids].nil?
      params[:user_ids] = []
      params[:user_ids].push(current_user.id)
      @book_id = params[:book_id]
      @club = ClubFacade.create_club(name: params[:name], book_id: params[:book_id], host_id: current_user.id, params: params[:user_ids])
      redirect_to "/clubs/#{@club.id}"
    else
      @book_id = params[:book_id]
      params[:user_ids].push(current_user.id)
      @club = ClubFacade.create_club(name: params[:name], book_id: params[:book_id], host_id: current_user.id, params: params[:user_ids])
      redirect_to "/clubs/#{@club.id}"
    end
  end
end
