class UsersController < ApplicationController
  # before_action :quote, only: [:new]

  def new; end

  def show
    unless current_user.nil?
      @user = current_user
      @clubs = UserFacade.user_clubs(@user.id)
    end
  end

  def create
    # conn = Faraday.new(url: 'http://localhost:3000/')
    conn = Faraday.new(url: 'https://hidden-garden-03870.herokuapp.com/')
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']

    response = conn.post('/api/v1/users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = JSON.generate(user: { username: email, email: email })
    end
  
    if response.status == 400
      response = conn.get('/api/v1/users') do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = JSON.generate(user: { username: email, email: email })
      end
      user = JSON.parse(response.body, symbolize_names: true)[:data]
      selected = user.select {|x| x[:attributes][:email] == email}
      session[:user_id] = selected[0][:id]
    else
      user = JSON.parse(response.body, symbolize_names: true)[:data]
      session[:user_id] = user[:id]
    end
    redirect_to '/dashboard'

    # if response.status == 400
    #   response = conn.get('/api/v1/users') do |req|
    #     req.headers['Content-Type'] = 'application/json'
    #     req.body = JSON.generate(user: { username: email, email: email })
    #   end
    # end
    # user = JSON.parse(response.body, symbolize_names: true)[:data]
    # # binding.pry
    # session[:user_id] = user[:id]
    # redirect_to '/dashboard'
  end
end
