class QuotesController < ApplicationController
  get '/quotes/new' do
    erb :'/quotes/new'
  end

  post '/quotes/new' do
    @quote = Quote.new(quote: params[:quotes])
    if @quote
      erb :'/quotes/index'
    else
      erb :'/quotes/new'
    end
  end
end
