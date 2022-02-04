require 'rails_helper'
RSpec.describe SearchMovie do
  it 'is initialized with a hash' do
    result = { original_title: 'The Patriot',
               vote_average: 10 }
    search_movie = SearchMovie.new(result)
    expect(search_movie.title).to eq('The Patriot')
    expect(search_movie.vote_average).to eq(10)
  end
end
