class UsersController < ApplicationController

  def create
    # require "pry"; binding.pry
    #use User.find_or_create_by
    #this action creates a user poro
    #calls to BE
    #checks BE database for user with email address
    #if doesn't exist, creates
    #then redirects to newly logged in users dashboard

    #Check email is verified, if not make sad path that asks user to verify email with google.
    # auth_hash = request.env['omniauth.auth']
    # email = auth_hash['info']['email']

    #Make User poro
    # user = User.new(email: params['info']['email'], name: params['info']['name'])

    #BE user create
    # user = User.find_or_create_by(email: user.email)
    if user.save
      redirect_to' /dashboard'
    else
      flash: user doe not exists
    end

    session[:access_token] = params['credentials']['token']
    redirect_to '/dashboard'
  end
end
