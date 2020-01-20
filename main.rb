require "httparty"
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
# environment variables

get '/' do 

  erb :index
end

get '/about' do
  erb :about
end

get '/movies' do   #'/movies/:title' another way
@title = params[:title]
# @poster_url = "https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg"
#  info_result = HTTParty.get(@poster_url)
# #  p info_result
# t= this one have to follow api link http://omdbapi.com/?t=jaws&apiKey=2f6....
 @url = "http://omdbapi.com/?t=#{@title}&apiKey=#{ENV['OMDB_API_KEY']}"
@result =HTTParty.get(@url)
# puts "#{@result["Poster"]}"
erb :movie
# @url first do , see find out how the url look like..only have t, no title
end
