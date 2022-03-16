class WelcomeController < ApplicationController
  # before_action :quote, only: [:index]

  def index
    @book_of_the_week = BookFacade.book_show("aWYwDwAAQBAJ")

    @popular_books = NytFacade.best_sellers_hardcover_fiction

    if params[:search].present? && BookFacade.find_book(params[:search]).nil?
      flash[:error] = "We failed you or this book does not exist"

    elsif params[:search].present?
      @books = BookFacade.find_book(params[:search])
      #need a way to refresh page as flash error is persisting through.
    end
  end

end
