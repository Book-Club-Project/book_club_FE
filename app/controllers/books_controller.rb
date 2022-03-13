class BooksController < ApplicationController
  def index
    if params[:search].present? && BookFacade.find_book(params[:search]).nil?
      flash[:error] = "We failed you or this book does not exist"

    elsif params[:search].present?
      @books = BookFacade.find_book(params[:search])
      #need a way to refresh page as flash error is persisting through.
    end
  end

  def show
    @book = BookFacade.book_show(params[:id])
  end

  private
  def book_params
    params.require(:books).permit(:title, :author, :summary, :rating, :genre)
  end
end
