require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :email}
  end

  describe "relationships" do
    it {should have_many(:user_partys)}
    it {should have_many(:partys).through(:user_partys)}
  end
end
