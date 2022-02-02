require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
      it 'get the top movie api information and parses', :vcr do
        expect(MovieService.get_top_rated).to be_an(Array)
        expect(MovieService.get_top_rated.length).to eq(20)
        expect(MovieService.get_top_rated.first[:title]).to eq("Your Eyes Tell")
        expect(MovieService.get_top_rated.first[:adult]).to eq(false)
        expect(MovieService.get_top_rated.first[:original_language]).to eq("ja")
    end
  end
end
