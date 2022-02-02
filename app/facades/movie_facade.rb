class MovieFacade
  def self.movies
    results = MovieService.get_top_rated
    results.map do |result|
      Movie.new(result)
    end
  end
end