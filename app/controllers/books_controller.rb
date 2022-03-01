class BooksController < ApplicationController
  def index
    searched_title = params[:search]
    if params[:search].present?
      @books = BookFacade.find_book(searched_title)
    else
      flash[:error] = "We failed you or this book does not exist"
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
