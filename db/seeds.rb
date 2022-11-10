# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts 'Cleaning database...'
Movie.destroy_all

puts 'Fetching Movies...'

url = "https://tmdb.lewagon.com/movie/top_rated"

buffer = URI.open(url).read

movie_list = JSON.parse(buffer)
movie = movie_list['results'][0]
# pp movie['original_title'], movie['vote_average']

puts "Adding movies to db..."
10.times do |index|
  movie = movie_list['results'][index - 1]
  # puts movie['original_title']
  Movie.create!(title: movie['original_title'], overview: movie['overview'],
                poster_url: movie['poster_path'], rating: movie['vote_average'])
end
