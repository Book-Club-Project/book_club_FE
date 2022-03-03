class ClubsController < ApplicationController

  def show
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
    @book_id = params[:book_id]
    @club = ClubFacade.create_club(name: params[:club_name], book_id: params[:book_id], host_id: 3)
    redirect_to "/clubs/#{@club.id}"
  end
end
