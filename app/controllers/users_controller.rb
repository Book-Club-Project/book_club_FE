class UsersController < ApplicationController
  before_action :quote, only: [:new]
  def show
    @user = current_user
  end

  def new; end

  def create
    if params[:password_confirmation]
      conn = Faraday.new(url: 'http://localhost:3000/')
      response = conn.post('/api/v1/users') do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = JSON.generate(user: { username: params[:username], email: params[:email] })
      end
      user = JSON.parse(response.body, symbolize_names: true)

    else
      conn = Faraday.new(url: 'http://localhost:3000/')
      auth_hash = request.env['omniauth.auth']
      email = auth_hash['info']['email']

      response = conn.post('/api/v1/users') do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = JSON.generate(user: { username: email, email: email })
      end
      user = JSON.parse(response.body, symbolize_names: true)[:data]
    end

    session[:user_id] = user[:id]

    redirect_to '/dashboard'
  end
end
