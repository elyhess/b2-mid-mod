class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.average_age
    average(:age)
  end

  def self.sort_by_youngest
    order(:age)
  end

  def self.not_in_movies
    left_joins(:movie_actors)
    .where('movie_actors.movie_id IS NULL')
  end
end
