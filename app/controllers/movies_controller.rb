class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.movies
    @user = User.find(params[:id])
  end
end
