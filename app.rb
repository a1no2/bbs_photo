require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'open-uri'
require 'sinatra/json'
require './models/contribution.rb'
require './image_uploader.rb'


get '/' do
    @contents = Contribution.order('id desc').all
    erb :index
end

post '/new' do
    setup
    Contribution.create({
        name: params[:user_name],
        body: params[:body],
        img: ""
    })
    
    if params[:file]
        image_upload(params[:file])
    end
    redirect '/'
end


post '/delete/:id' do
    Contribution.find(params[:id]).destroy
    redirect '/'
end


post '/edit/:id' do
    @content = Contribution.find(params[:id])
    erb :edit
end

post '/renew/:id' do
    @content = Contribution.find(params[:id])
    @content.update({
        name: params[:user_name],
        body: params[:body]
    })
    redirect '/'
end
    
def setup
   Cloudinary.config do |config|
      config.cloud_name = "dvoflykmh"
      config.api_key    = "941587837424911"
      config.api_secret = "jrI0LdzVc2lkQdIPWRUmJa0DQcQ"
    end 
end