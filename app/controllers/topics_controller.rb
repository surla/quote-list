class TopicsController < ApplicationController
  get '/topics' do
    @topics = Topic.all
    erb :'/topics/index'
  end

  get '/topics/:id' do
    @topic = Topic.find(params[:id])
    erb :'/topics/show'
  end

  delete '/topics/:id/delete' do
    @topic = Topic.find(params[:id])
    @topic.delete
    redirect :'/topics'
  end
end
