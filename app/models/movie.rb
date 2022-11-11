class Movie < ApplicationRecord
  MOVIE_POSTER_BASE_URL = "https://image.tmdb.org/t/p/w200"

  has_many :bookmarks
  has_many :lists, through: :bookmarks

  validates :title, :overview, presence: true
  validates :title, uniqueness: true
end
