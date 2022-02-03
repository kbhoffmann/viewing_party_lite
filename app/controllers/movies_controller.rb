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
    movie = MovieService.movie_details(params[:movie_id])
    @movie = 'Big Trouble in Little China'

    # i think this will be an object that's a new poro,
    # a combo of the three api endpoints we need
  end
end
