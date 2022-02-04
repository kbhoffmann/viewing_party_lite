class NewMovieParty
  attr_reader :id,
              :title,
              :runtime
  def initialize(id, title, runtime)
    @id = id
    @title = title
    @runtime = runtime[0].to_i * 60 + runtime[2..3].to_i
  end
end