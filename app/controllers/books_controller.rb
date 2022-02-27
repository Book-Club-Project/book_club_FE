class BooksController < ApplicationController

  def show
    @book = BookFacade.book_show(params[:id])
  end
end
