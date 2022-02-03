require 'rails_helper'
RSpec.describe 'the movie show page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu') }

  it 'has a link back to the welcome page' do
    visit "/users/#{user_1.id}/movies/1"
    click_link('Welcome Page')
    expect(current_path).to eq('/')
  end
end
