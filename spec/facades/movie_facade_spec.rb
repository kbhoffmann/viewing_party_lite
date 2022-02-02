require 'rails_helper'
RSpec.describe MovieFacade do

  it "creates an array of movie objects", :vcr do
    expect(MovieFacade.movies).to be_an(Array)
    expect(MovieFacade.movies.length).to eq(40)
    expect(MovieFacade.movies.first.title).to eq("Your Eyes Tell")
    expect(MovieFacade.movies.first).to be_a(Movie)
  end
end