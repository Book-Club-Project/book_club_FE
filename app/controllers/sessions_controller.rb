class SessionsController < ApplicationController
  before_action :quote, only: [:new]

  def new; end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
