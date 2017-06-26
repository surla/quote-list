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
    @quote = Quote.find(params[:id])
    if logged_in? && current_user.quotes.include?(@quote)
      erb :'/quotes/edit'
    else
      erb :'/quotes/show', locals: {message: "Cannot edit other user's quote"}
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
    @quote.update(quote: params[:quote])
    @quote.author = Author.find_or_create_by(name: params[:author])
    @quote.topic = Topic.find_or_create_by(name: params[:topic])
    if @quote.save
      erb :'/quotes/show', locals: {message: "Successfully edited quote"}
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
