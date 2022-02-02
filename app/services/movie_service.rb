class MovieService
  def self.get_top_rated
    response = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")
    response_2 = Faraday.get("https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=2")
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed_2 = JSON.parse(response_2.body, symbolize_names: true)
    (parsed[:results] << parsed_2[:results]).flatten
  end
end
