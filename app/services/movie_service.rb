class MovieService

  def self.get_url(url)
    Faraday.new(url)
  end

  def self.conn
    get_url(url: "https://api.themoviedb.org")
  end

  def self.get_top_rated
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")
    response_2 = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_api_key']}&language=en-US&page=2")

    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed_2 = JSON.parse(response_2.body, symbolize_names: true)

    (parsed[:results] << parsed_2[:results]).flatten
  end

  def self.movie_search(title)
    response = conn.get("/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=#{title}&page=1")
    response_2 = conn.get("/3/search/movie?api_key=#{ENV['movie_api_key']}&language=en-US&query=#{title}&page=2")

    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed_2 = JSON.parse(response_2.body, symbolize_names: true)

    (parsed[:results] << parsed_2[:results]).flatten
    #might need to move these into poro?
  end

  def self.movie_details_id(movie_id)
    response = conn.get("/3/movie/#{movie_id}?api_key=#{ENV['movie_api_key']}&language=en-US")
    parsed = JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_cast(movie_id)
    response = conn.get("/3/movie/#{movie_id}/credits?api_key=#{ENV['movie_api_key']}&language=en-US")
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:cast][0..9]
  end

  def self.get_reviews(movie_id)
    response = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}&language=en-US&page=1")
    # response_2 = conn.get("/3/movie/#{movie_id}/reviews?api_key=#{ENV['movie_api_key']}&language=en-US&page=2")
    parsed = JSON.parse(response.body, symbolize_names: true)
    # parsed_2 = JSON.parse(response_2.body, symbolize_names: true)
    parsed[:results] #<< parsed_2[:results]).flatten
    #need count of total reviews and review's author info
  end
end
