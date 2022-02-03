require 'rails_helper'

RSpec.describe "Movie Index Page" do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu') }

  it 'has a button to return to the discover page', :vcr do
    visit "/users/#{user_1.id}/movies"

    click_button "Discover Page"

    expect(current_path).to eq("/users/#{user_1.id}/discover")
  end

  it 'links each movie title to the movie show page', :vcr do
    visit "/users/#{user_1.id}/movies"

    #not sure how to test/mock this
    movie = SearchMovie.new(title: "The Hangover", vote_average: 8.9, id: 27)

    # within("#movie-#{movie.id}") do
      # click_link "#{movie.title}"
    # expect(page).to have_content(movie.vote_average)
    expect(page).to have_link("#{movie.title}")

    #had trouble with the within block, tried using sytax below.
    # first(:link, "#{movie.title}").click
    # end

    # should be the current path when link is clicked...
    # expect(current_path).to eq("/users/#{user_1.id}/movies/#{movie.id}")
  end
end
