class MovieFacade
  def self.movies
    results = MovieService.get_top_rated
    results.map do |result|
      Movie.new(result)
    end
  end

  def self.searched_movies(title)
    results = MovieService.movie_search(title)
    results.map do |result|
      SearchMovie.new(result)
    end
  end

  def self.movie_details_id(movie_id)
    movie_details = MovieService.movie_details_id(movie_id)
    movie_cast = MovieService.get_cast(movie_id)
    movie_reviews = MovieService.get_reviews(movie_id)
    x = MovieDetail.new(movie_details, movie_cast, movie_reviews)
  end
end
