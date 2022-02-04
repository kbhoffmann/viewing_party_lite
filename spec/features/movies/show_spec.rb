require 'rails_helper'
RSpec.describe 'the movie show page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu') }

  it 'has a link back to the welcome page', :vcr do
    visit "/users/#{user_1.id}/movies/33"
    click_link('Welcome Page')
    expect(current_path).to eq('/')
  end

  it 'has a link to create a new viewing party for the movie', :vcr do
    visit "/users/#{user_1.id}/movies/33"
    click_button('Create Viewing Party for Unforgiven')
  end

  it 'displays the movie title', :vcr do
    visit "/users/#{user_1.id}/movies/33"
    expect(page).to have_content('Unforgiven')
  end

  it "display's the movie's vote average", :vcr do
    visit "/users/#{user_1.id}/movies/33"
    expect(page).to have_content('Vote Average: 7.9')
  end

  it "displays the movie's runtime", :vcr do
    visit "/users/#{user_1.id}/movies/33"
    expect(page).to have_content('Runtime: 2hrs 17mins')
  end

  it "displays the movie's genre(s)", :vcr do
    visit "/users/#{user_1.id}/movies/33"
    expect(page).to have_content('Genre(s): Western')
  end

  it "displays the movie's cast and roles", :vcr do
    visit "/users/#{user_1.id}/movies/33"
    expect(page).to have_content('Clint Eastwood as William Munny')
    expect(page).to have_content("Gene Hackman as 'Little' Bill Daggett")
    expect(page).to have_content('Morgan Freeman as Ned Logan')
    expect(page).to have_content('Richard Harris as English Bob')
    expect(page).to have_content('Jaimz Woolvett as The Schofield Kid')
    expect(page).to have_content('Anna Levine as Delilah Fitzgerald')
    expect(page).to have_content('Saul Rubinek as W.W. Beauchamp')
    expect(page).to have_content('Frances Fisher as Strawberry Alice')
    expect(page).to have_content('David Mucci as Quick Mike')
    expect(page).to have_content('Rob Campbell as Davey Bunting')
  end

  it "displays the movie's summary", :vcr do
    visit "/users/#{user_1.id}/movies/33"
    expect(page).to have_content('William Munny is a retired, once-ruthless killer turned gentle widower and hog farmer. To help support his two motherless children, he accepts one last bounty-hunter mission to find the men who brutalized a prostitute. Joined by his former partner and a cocky greenhorn, he takes on a corrupt sheriff.')
  end

  it 'shows all the reviews are reviewers for the movie', :vcr do
    visit "/users/#{user_1.id}/movies/33"
    expect(page).to have_content('Author: redTed')
    expect(page).to have_content('Review: Quite easily the finest western ever made and very close to the greatest film ever made.')
    expect(page).to have_content('Author: John Chard')
    expect(page).to have_content("Review: That's right. I'm just a fella now. I ain't no different than anyone else no more.")
  end
end
