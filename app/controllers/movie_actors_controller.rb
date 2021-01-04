class MovieActorsController < ApplicationController
  def create
    @actor = Actor.find_by(name: params[:actor_name])
    @movie = Movie.find(params[:movie_id])
    MovieActor.create(actor: @actor, movie: @movie)
    redirect_to movie_path(@movie)
  end
end