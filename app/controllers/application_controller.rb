class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # require "pry"; binding.pry
    # @new_user if session[:user_id]

  end
end
