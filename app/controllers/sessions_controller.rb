class SessionsController < ApplicationController
  get '/login' do
    @user = User.new
    erb :'/sessions/new'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      erb :'/users/index'
    else
      erb :'/sessions/new'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
