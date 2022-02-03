class Movie
  attr_reader :adult,
              :backdrop_path,
              :genre_ids,
              :id,
              :original_language,
              :original_title,
              :overview,
              :popularity,
              :poster_path,
              :release_date,
              :title,
              :vote_count,
              :vote_average

  def initialize(result)
    @adult = result[:adult]
    @backdrop_path = result[:backdrop_path]
    @genre_ids = result[:genre_ids]
    @id = result[:id]
    @original_language = result[:original_language]
    @original_title = result[:original_title]
    @overview = result[:overview]
    @popularity = result[:popularity]
    @poster_path = result[:poster_path]
    @release_date = result[:release_date]
    @title = result[:title]
    @vote_count = result[:vote_count]
    @vote_average = result[:vote_average]
  end
end
