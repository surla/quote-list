class QuotesController < ApplicationController

  get '/quotes' do
    if logged_in?
      @quotes = Quote.all
      erb :'/quotes/index'
    else
      redirect :'/login'
    end
  end

  get '/quotes/new' do
    if logged_in?
      @quote = Quote.new
      erb :'/quotes/new'
    else
      redirect :'/login'
    end
  end

  get '/quotes/:id' do
    if logged_in?
      @quote = Quote.find(params[:id])
      erb :'/quotes/show'
    else
      redirect :'/login'
    end
  end

  get '/quotes/:id/edit' do
    if logged_in? && current_user
      @quote = Quote.find(params[:id])
      erb :'/quotes/edit'
    else
      redirect :'/login'
    end
  end

  post '/quotes/new' do
    @quote = Quote.new(quote: params[:quote])
    @quote.author = Author.find_or_create_by(name: params[:author])
    @quote.topic = Topic.find_or_create_by(name: params[:topic])
    if @quote.save
      @quote.users << current_user
      erb :'/quotes/show' , locals: {message: "Successfully created quote."}
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

  delete '/quotes/:id/delete' do
    @quote = Quote.find(params[:id])
    @quote.delete
    redirect :'/quotes'
  end
end
