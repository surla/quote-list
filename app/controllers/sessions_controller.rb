class SessionsController < ApplicationController
  get '/login' do
    erb :'/sessions/new'
  end

  post '/login' do
    @user = User.find_by(params[:username])
    if @user && @user.authenticate(params[:password])
      erb :'/users/index'
    else
      erb :'/sessions/new'
    end
  end
end
