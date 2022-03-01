class UsersController < ApplicationController
  before_action :quote, only: [:new]
  def new; end

  def create
    conn = Faraday.new(url: 'http://localhost:3000/')
    auth_hash = request.env['omniauth.auth']
    email = auth_hash['info']['email']

    response = conn.post('/api/v1/users') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = JSON.generate(user: { username: email, email: email })
    end
    user = JSON.parse(response.body, symbolize_names: true)

    session[:user_id] = user[:data][:id]
    redirect_to '/'
  end
end
