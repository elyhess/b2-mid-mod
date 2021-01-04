class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = Actor.not_in_movies

    if @movie.actors.empty?
      @actors_avg_age = 0
    else
      @actors_avg_age = @movie.actors.average_age.round(2)
    end

  end
end