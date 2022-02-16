require 'rails_helper'

RSpec.describe 'Movie Index Page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: "1234") }

  it 'has a button to return to the discover page', :vcr do
    visit "/users/#{user_1.id}/movies"

    click_button 'Discover Page'

    expect(current_path).to eq("/users/#{user_1.id}/discover")
  end

  it 'links to each movie show page when sorted by top 40', :vcr do
    visit "/users/#{user_1.id}/movies"
    click_link 'The Shawshank Redemption'
    expect(current_path).to eq("/users/#{user_1.id}/movies/278")
  end

  it 'links each movie title to the movie show page when searching by title', :vcr do
    title = 'Big Trouble in Little China'
    visit "/users/#{user_1.id}/movies?title=#{title}"
    click_link('Big Trouble in Little China')
    expect(page).to have_content('Big Trouble in Little China')
  end
end
