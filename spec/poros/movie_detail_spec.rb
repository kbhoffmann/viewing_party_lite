require 'rails_helper'

RSpec.describe MovieDetail do
  it 'exists' do
    movie_details = {
                  id: 27,
                  title: "A Movie",
                  runtime: 115,
                  genres: [{id: 2, name: "Comedy"}, {id: 4, name: "Action"}],
                  overview: "Hilarous comedy about a guy",
                  vote_average: 2.5,
                    }
    movie_cast = [{name: "John Doe", character: "Funny Guy"},
                  {name: "Jane Doe", character: "Funny Gal"}]
    movie_reviews = [{author: "reviewer_1", content: "This movie was terrible"},
                     {author: "reviewer_2", content: "This movie was ok"},
                     {author: "reviewer_3", content: "It was better while drinking"}]

    movie = MovieDetail.new(movie_details, movie_cast, movie_reviews)

    expect(movie).to be_a MovieDetail
    expect(movie.id).to eq(27)
    expect(movie.title).to eq("A Movie")
    expect(movie.runtime).to eq(1.92)
    expect(movie.genres).to be_an(Array)
    expect(movie.genres.length).to eq(2)
    expect(movie.summary).to eq("Hilarous comedy about a guy")
    expect(movie.vote_average).to eq(2.5)
    expect(movie.cast.count).to eq(2)
    expect(movie.reviews).to be_a(Hash)
    expect(movie.review_count).to eq(3)
  end

  it 'formats the cast into a hash of a actor name and the actors character' do
    movie_details = {
                  id: 27,
                  title: "A Movie",
                  runtime: 115,
                  genres: [{id: 2, name: "Comedy"}, {id: 4, name: "Action"}],
                  overview: "Hilarous comedy about a guy",
                  vote_average: 2.5,
                    }
    movie_cast = [{name: "John Doe", character: "Funny Guy"},
                  {name: "Jane Doe", character: "Funny Gal"}]

    movie_reviews = [{author: "reviewer_1", content: "This movie was terrible"},
                     {author: "reviewer_2", content: "This movie was ok"},
                     {author: "reviewer_3", content: "It was better while drinking"}]

    movie = MovieDetail.new(movie_details, movie_cast, movie_reviews)

    cast_hash = {"John Doe"=>"Funny Guy", "Jane Doe"=>"Funny Gal"}

    expect(movie.format_cast(movie_cast)).to eq(cast_hash)
  end

  it 'formats the reviews into a hash of an author and the authors review' do
    movie_details = {
                  id: 27,
                  title: "A Movie",
                  runtime: 115,
                  genres: [{id: 2, name: "Comedy"}, {id: 4, name: "Action"}],
                  overview: "Hilarous comedy about a guy",
                  vote_average: 2.5,
                    }
    movie_cast = [{name: "John Doe", character: "Funny Guy"},
                  {name: "Jane Doe", character: "Funny Gal"}]

    movie_reviews = [{author: "reviewer_1", content: "This movie was terrible"},
                     {author: "reviewer_2", content: "This movie was ok"},
                     {author: "reviewer_3", content: "It was better while drinking"}]

    movie = MovieDetail.new(movie_details, movie_cast, movie_reviews)

    reviews_hash= {"reviewer_1"=>"This movie was terrible",
                   "reviewer_2"=>"This movie was ok",
                   "reviewer_3"=>"It was better while drinking"}
    expect(movie.format_reviews(movie_reviews)).to eq(reviews_hash)
  end

  it 'makes an array of all the genre names for a movie' do
    movie_details = {
                  id: 27,
                  title: "A Movie",
                  runtime: 115,
                  genres: [{id: 2, name: "Comedy"}, {id: 4, name: "Action"}],
                  overview: "Hilarous comedy about a guy",
                  vote_average: 2.5,
                    }
    movie_cast = [{name: "John Doe", character: "Funny Guy"},
                  {name: "Jane Doe", character: "Funny Gal"}]

    movie_reviews = [{author: "reviewer_1", content: "This movie was terrible"},
                     {author: "reviewer_2", content: "This movie was ok"},
                     {author: "reviewer_3", content: "It was better while drinking"}]

    movie = MovieDetail.new(movie_details, movie_cast, movie_reviews)

    genre_array = ["Comedy", "Action"]
    expect(movie.all_genres(movie_details)).to eq(genre_array)
  end
end
