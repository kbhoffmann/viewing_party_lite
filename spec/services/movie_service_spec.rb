require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    it 'get the top movie api information and parses', :vcr do
      expect(MovieService.get_top_rated).to be_an(Array)
      expect(MovieService.get_top_rated.length).to eq(40)
      expect(MovieService.get_top_rated.first[:title]).to eq('Your Eyes Tell')
      expect(MovieService.get_top_rated.first[:adult]).to eq(false)
      expect(MovieService.get_top_rated.first[:original_language]).to eq('ja')
    end

    it 'searches for a movie title and parses', :vcr do
      title = 'The Patriot'
      expect(MovieService.movie_search(title)).to be_an(Array)
      expect(MovieService.movie_search(title).first[:original_title]).to eq('The Patriot')
    end

    it 'returns search result of 40 movies', :vcr do
      title = 'The'
      expect(MovieService.movie_search(title)).to be_an(Array)
      expect(MovieService.movie_search(title).length).to eq(40)
    end

    it 'returns the details for a movie', :vcr do
      movie_id = 9

      expect(MovieService.movie_details(movie_id)).to be_an(Array)
    end

    it 'returns the cast members for a movie', :vcr do
      movie_id = 12

      expect(MovieService.get_cast(movie_id)).to be_an(Array)
    end

    it 'returns the reviews for a movie', :vcr do
      movie_id = 33
      
      expect(MovieService.get_reviews(movie_id)).to be_an(Array)
    end
  end
end
