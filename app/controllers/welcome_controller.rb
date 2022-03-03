class WelcomeController < ApplicationController
 
  before_action :current_user
  # before_action :quote, only: [:index]


  def index
    # require "pry"; binding.pry
  end

end
