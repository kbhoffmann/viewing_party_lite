require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
      it 'get the top movie api information and parses', :vcr do
        expect(MovieService.get_top_rated[:results]).to be_an(Array)
        expect(MovieService.get_top_rated[:results].length).to eq(20)
        expect(MovieService.get_top_rated[:results].first[:title]).to eq("Your Eyes Tell")
        expect(MovieService.get_top_rated[:results].first[:adult]).to eq(false)
        expect(MovieService.get_top_rated[:results].first[:original_language]).to eq("ja")
    end
  end
end
