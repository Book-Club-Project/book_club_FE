class BooksController < ApplicationController
  def index
    if params[:search]
      # binding.pry
      @books = BookFacade.find_book(params[:search])
      redirect_to '/discover'
    # else
    #   redirect_to '/discover'
    #   flash[:error] = "We failed you or this book does not exist"
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
