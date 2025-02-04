require 'rails_helper'

RSpec.describe Party do
  describe 'validations' do
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :duration }
  end

  describe 'relationships' do
    it { should have_many(:user_partys) }
    it { should have_many(:users).through(:user_partys) }
  end
end
