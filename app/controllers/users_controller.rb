class UsersController < ApplicationController


  get '/signup' do
    @user = User.new
    erb :'/users/new'
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password])
    if @user
      sessions[:user_id] = @user.id
      erb :'/users/index'
    else
      erb :'/users/new'
    end
  end
end
