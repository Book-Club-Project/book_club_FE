class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # helper_method :current_user

  def current_user
    if session[:user_id]
      UserFacade.find_user(session[:user_id])
    end
  end

  def quote
    @quote = QuoteFacade.get_quote
  end
end
