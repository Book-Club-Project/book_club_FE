class SessionsController < ApplicationController


  def destroy
    session.destroy
    redirect_to '/'
  end
end
