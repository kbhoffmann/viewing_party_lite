class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:title].present?
      @movies = MovieFacade.searched_movies(params[:title])
    else
    @movies = MovieFacade.movies
    end
  end
end
