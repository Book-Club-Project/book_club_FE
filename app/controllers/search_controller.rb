# class SearchController < ApplicationController
#   def index
#     if params[:search]
#       @books = BookFacade.find_book(params[:search])
#       binding.pry
#       redirect_to '/books'
#     # else
#     #   redirect_to '/discover'
#     #   flash[:error] = "We failed you or this book does not exist"
#     end
#   end
# end
