class SessionsController < ApplicationController

  def new
    # redirect_to '/auth/google_oauth2/callback'
    # conn = Faraday.new(url: 'http://localhost:3000/')
    #
    # auth_hash = request.env['omniauth.auth']
    # email = auth_hash['info']['email']
    #
    # session[:access_token] = auth_hash['credentials']['token']
    #
    # response = conn.get('/api/v1/users') do |req|
    #   req.headers['Content-Type'] = 'application/json'
    #   req.body = JSON.generate(user: { username: email, email: email })
    # end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

  # def create
  #   found_user = UserFacade.find_user(params[:user_id])
  #   user = User.find_or_create_by(username: auth_hash[‘info][‘email]) session[:user_id] = user.id
  # end

end
