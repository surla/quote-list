class UsersController < ApplicationController

  get '/users' do
    if logged_in?
      @user = User.find(session[:user_id])
      erb :'/users/index'
    else
      redirect :'/signup'
    end
  end

  get '/signup' do
    if logged_in?
      redirect :'/users'
    else
      @user = User.new
      erb :'/users/new'
    end
  end

  post '/signup' do
    @user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      erb :'/users/index'
    else
      erb :'/users/new'
    end
  end
end
