require 'rails_helper'
RSpec.describe Movie do
  it 'is initialized with a hash' do
    result = { title: 'The Patriot',
               vote_average: 10 }
    movie = Movie.new(result)
    expect(movie.title).to eq('The Patriot')
    expect(movie.vote_average).to eq(10)
  end
end
