class MovieDetail
  def initialize(movie_details, movie_cast, movie_reviews)
    @id = movie_details[:id]
    @title = movie_details[:title]
    @runtime = movie_details[:runtime]
    @genres = movie_details[:genres][0][:name]
    @summary = movie_details[:overview]
    @vote_average = movie_details[:vote_average]
    @cast = format_cast(movie_cast)
    @reviews
    #count of reviews
    #author
    #review body
  end

  def format_cast(movie_cast)
    cast_hash = Hash.new
    movie_cast.each do |actor|
      cast_hash[actor[:name]] = actor[:character]
    end
    cast_hash
  end
end
