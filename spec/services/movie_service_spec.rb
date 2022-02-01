require 'rails_helper'

RSpec.describe MovieService do
  describe 'class methods' do
    xit 'get the api information and parses' do
      expect(MovieService.get_top_rated).to eq(1)
    end
  end
end
