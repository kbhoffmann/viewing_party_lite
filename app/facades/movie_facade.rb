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
end