class TopicsController < ApplicationController
  get '/topics' do
    if logged_in?
      @topics = Topic.all
      erb :'/topics/index'
    else
      redirect :'/login'
    end
  end

  get '/topics/:id' do
    if logged_in?
      @topic = Topic.find(params[:id])
      erb :'/topics/show'
    else
      redirect :'/login'
    end
  end

  delete '/topics/:id/delete' do
    @topic = Topic.find(params[:id])
    @topic.delete
    redirect :'/topics'
  end
end
