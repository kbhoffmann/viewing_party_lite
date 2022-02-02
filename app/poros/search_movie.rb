class SearchMovie
  attr_reader :title,
              :vote_average
  def initialize(result)
    @title = result[:original_title]
    @vote_average = result[:vote_average]
  end
end