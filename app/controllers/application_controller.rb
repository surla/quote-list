class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'quotes'
  end

  get '/' do
    erb :index
  end

  helpers do
   def current_user
     @user || User.find_by_id(session[:user_id])
   end
  end
end
