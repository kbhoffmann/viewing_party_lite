class MoviesController < ApplicationController
  def index
    parsed = MovieService.get_top_rated

  end
end