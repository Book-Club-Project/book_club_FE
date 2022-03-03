class WelcomeController < ApplicationController

  before_action :quote, only: [:index]
  before_action :current_user

  def index
    # require "pry"; binding.pry
  end

end
