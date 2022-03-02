class ClubsController < ApplicationController

  def show
    club_id = params[:id]
    @club = ClubFacade.get_club(club_id)
    @club_users = ClubFacade.get_club_users(club_id)
    @book_id = @club.book_id
    @book = BookFacade.book_show(@book_id)
    @comments = ClubFacade.get_club_comments(club_id)
  end

end
