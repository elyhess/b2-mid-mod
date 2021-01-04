class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.not_in_movies
  end
end