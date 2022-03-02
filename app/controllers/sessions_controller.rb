class SessionsController < ApplicationController
  # before_action :quote, only: [:new]

  def new; end

  def create
    authenticated_user = AuthenticationFacade.authenticate_user_by_email(params[:email], params[:password])

    if authenticated_user
      session[:user_id] = authenticated_user.id
      flash[:success] = "Welcome, #{authenticated_user.email}"
      redirect_to '/dashboard'
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end
end
