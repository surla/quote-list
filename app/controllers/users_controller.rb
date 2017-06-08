class UsersController < ApplicationController

  get '/users/index' do
    @user = User.find(session[:user_id])
    erb :'/users/index'
  end

  get '/signup' do
    @user = User.new
    erb :'/users/new'
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      erb :'/users/index'
    else
      erb :'/users/new'
    end
  end
end
