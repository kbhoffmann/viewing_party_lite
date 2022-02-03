class SearchMovie
  attr_reader :title,
              :vote_average,
              :id

  def initialize(result)
    @title = result[:original_title]
    @vote_average = result[:vote_average]
    @id = result[:id]
  end
end
