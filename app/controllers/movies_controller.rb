class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @movies = if params[:title].present?
                MovieFacade.searched_movies(params[:title])
              else
                MovieFacade.movies
              end
  end

  def show
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_details_id(params[:movie_id])
  end
end
