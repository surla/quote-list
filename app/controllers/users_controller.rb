class UsersController < ApplicationController


  get '/signup' do
    @user = User.new
    erb :'/users/new'
  end

  post '/signup' do
    @user = User.new(email: params[:email], password: params[:password])
    @user.save
    erb :'/users/index'
  end
end
