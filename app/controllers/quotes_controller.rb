class QuotesController < ApplicationController

  get '/quotes' do
    @quotes = Quote.all
    erb :'/quotes/index'
  end

  get '/quotes/new' do
    erb :'/quotes/new'
  end

  post '/quotes/new' do
    @quote = Quote.new(quote: params[:quote])
    @quote.users << current_user
    @quote.author = Author.find_or_create_by(name: params[:author_name])
    if @quote.save
      erb :'/quotes/show'
    else
      erb :'/quotes/new'
    end
  end

  get '/quotes/:id' do
    @quote = Quote.find(params[:id])
    erb :'/quotes/show'
  end

end
