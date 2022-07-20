# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

# Get a list of 20 top movies
url = 'https://tmdb.lewagon.com/movie/top_rated'
url_open = URI.open(url).read
top_movies = JSON.parse(url_open)

top_movies['results'].each do |result|
  puts("Creating #{result['title']}")
  Movie.create(title: result['title'],
                overview: result['overview'],
                poster_url: "https://image.tmdb.org/t/p/original#{result['poster_path']}",
                rating: result['vote_average'])
end
puts("Ended top movies creation!")

# Get a list of 20 popular movies
url = 'https://tmdb.lewagon.com/movie/popular'
url_open = URI.open(url).read
top_movies = JSON.parse(url_open)

top_movies['results'].each do |result|
  puts("Creating #{result['title']}")
  Movie.create(title: result['title'],
                overview: result['overview'],
                poster_url: "https://image.tmdb.org/t/p/original#{result['poster_path']}",
                rating: result['vote_average'])
end
puts("Ended top movies creation!")
