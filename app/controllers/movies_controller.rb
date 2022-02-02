class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.movies
  end
end