require 'rails_helper'
RSpec.describe NewMovieParty do
  it 'is initalized with id, title, and runtime' do
    new_movie_party_1 = NewMovieParty.new(1, 'Midnight in Paris', '2.17')
    expect(new_movie_party_1.id).to eq(1)
    expect(new_movie_party_1.title).to eq('Midnight in Paris')
    expect(new_movie_party_1.runtime).to eq(137)
  end
end
