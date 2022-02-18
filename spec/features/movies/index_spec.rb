require 'rails_helper'

RSpec.describe 'Movie Index Page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: 'pw123', password_confirmation: 'pw123') }

  before :each do
    visit '/login'
    fill_in :email, with: 'george@csu.edu'
    fill_in :password, with: 'pw123'
    click_on "Login"
  end

  it 'has a button to return to the discover page', :vcr do
    visit "/movies"

    click_button 'Discover Page'

    expect(current_path).to eq("/discover")
  end

  it 'links to each movie show page when sorted by top 40', :vcr do
    visit "/movies"
    click_link 'The Shawshank Redemption'
    expect(current_path).to eq("/movies/278")
  end

  it 'links each movie title to the movie show page when searching by title', :vcr do
    title = 'Big Trouble in Little China'
    visit "/movies?title=#{title}"
    click_link('Big Trouble in Little China')
    expect(page).to have_content('Big Trouble in Little China')
  end
end
