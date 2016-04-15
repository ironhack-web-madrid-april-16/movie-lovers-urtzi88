require 'sinatra'
require 'sinatra/reloader' if development?
require 'haml'
require 'pry'
require_relative 'lib/movie.rb'

set :haml, :format => :html5
enable(:sessions)

@@list = MovieList.new

get '/' do
  haml(:index)
end

post '/movies' do
  @word = params[:word]
  @@list.search(@word)
  @@list.get_nine_with_poster
  @rand_year = @@list.random_year
  haml(:movies)
end
