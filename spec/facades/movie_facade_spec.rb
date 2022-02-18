require 'rails_helper'
RSpec.describe MovieFacade do
  it 'creates an array of movie objects', :vcr do
    expect(MovieFacade.movies).to be_an(Array)
    expect(MovieFacade.movies.length).to eq(40)
    # expect(MovieFacade.movies.first.title).to eq('Your Eyes Tell')
    expect(MovieFacade.movies.first).to be_a(Movie)
  end

  it 'creates an array of searched movie objects', :vcr do
    title = 'The Patriot'
    expect(MovieFacade.searched_movies(title)).to be_an(Array)
    expect(MovieFacade.searched_movies(title).first.title).to eq('The Patriot')
    expect(MovieFacade.searched_movies(title).first).to be_a(SearchMovie)
  end

  it 'creates a detailed movie object', :vcr do
    movie_id = 33
    expect(MovieFacade.movie_details_id(movie_id)).to be_a(MovieDetail)
    # expect(MovieFacade.movie_details_id(movie_id))
    # expect(MovieFacade.movie_details_id(movie_id))
  end
end
