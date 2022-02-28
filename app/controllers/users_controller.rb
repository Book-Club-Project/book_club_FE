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
    redirect_to '/'
  end
end
