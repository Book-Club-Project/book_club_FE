class WelcomeController < ApplicationController
  # before_action :quote, only: [:index]

  def index
    if params[:search].present? && BookFacade.find_book(params[:search]).nil?
      flash[:error] = "We failed you or this book does not exist"

    elsif params[:search].present?
      @books = BookFacade.find_book(params[:search])
      #need a way to refresh page as flash error is persisting through.
    end
  end

end
