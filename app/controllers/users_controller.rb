class UsersController < ApplicationController

  def new
  end

  def create
    conn = Faraday.new(url: 'http://localhost:3000/')
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']

    session[:access_token] = auth_hash['credentials']['token']

    response = conn.post('/api/v1/users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = JSON.generate(user: { username: email, email: email })
    end
    @user = JSON.parse(response.body, symbolize_names: true)
    # require "pry"; binding.pry
    # @new_user = User.new(user)
    session[:user_id] = @user[:data][:id]
    redirect_to '/'




############### Unused code that grabbed a user if the user being created already existed #################################
    # UserFacade.create_user(params)
    #
    # found_user = UserFacade.find_user(params[:google_id])

    # if response.status == 400
    #   request = conn.get("/api/v1/users/") do |req|
    #     req.headers['Content-Type'] = 'application/json'
    #     req.body = JSON.generate(user: { username: email, email: email })
    #   end
    # end
    # @e = JSON.parse(request.body, symbolize_names: true)

    # require "pry"; binding.pry
    # @user = User.new(request[:data][:attributes])

  end
end
