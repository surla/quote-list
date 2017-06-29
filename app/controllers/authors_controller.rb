class AuthorsController < ApplicationController
  get '/authors' do
    @authors = Author.all
    erb :'authors/index'
  end

  get '/authors/:id' do
    @author = Author.find(params[:id])
    erb :'/authors/show'
  end

  delete '/authors/:id/delete' do
    @author = Author.find(params[:id])
    @author.delete
    redirect :'/authors'
  end
end
