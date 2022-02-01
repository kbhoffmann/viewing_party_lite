class MovieService
  def self.get_top_rated
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end
end
