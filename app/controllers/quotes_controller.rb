class QuotesController < ApplicationController

  get '/quotes' do
    @quotes = Quote.all
    erb :'/quotes/index'
  end

  get '/quotes/new' do
    @quote = Quote.new
    erb :'/quotes/new'
  end

  get '/quotes/:id' do
    @quote = Quote.find(params[:id])
    erb :'/quotes/show'
  end

  get '/quotes/:id/edit' do
    @quote = Quote.find(params[:id])
    erb :'/quotes/edit'
  end


  post '/quotes/new' do
    @quote = Quote.new(quote: params[:quote])
    @quote.users << current_user
    @quote.author = Author.find_or_create_by(name: params[:author])
    @quote.topic = Topic.find_or_create_by(name: params[:topic])
    if @quote.save
      erb :'/quotes/show'
    else
      erb :'/quotes/new'
    end
  end

  patch '/quotes/:id' do
    @quote = Quote.find(params[:id])
    @quote.author = Author.find_or_create_by(name: params[:author])
    @quote.topic = Topic.find_or_create_by(name: params[:topic])
    if @quote.save
      erb :'/quotes/show'
    else
      erb :'/quotes/edit'
    end
  end

  post '/quotes/:id/delete' do
    @quote = Quote.find(params[:id])
    @quote.delete
    redirect :'/quotes'
  end
end
