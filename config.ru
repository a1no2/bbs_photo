require 'bundler'
Bundler.require

require './app'

Dotenv.load

# Cloudinary.config do |config|
#   config.cloud_name = ENV['CLOUD_NAME']
#   config.api_key    = ENV['CLOUDINARY_API_KEY']
#   config.api_secret = ENV['CLOUDINARY_API_SECRET']
# end

Cloudinary.config do |config|
  config.cloud_name = "dvoflykmh"
  config.api_key    = "941587837424911"
  config.api_secret = "jrI0LdzVc2lkQdIPWRUmJa0DQcQ"
end

run Sinatra::Application
