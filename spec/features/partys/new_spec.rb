require 'rails_helper'
RSpec.describe 'the new party page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: "1234") }
  let!(:user_2) { User.create!(name: 'Billy Bo', email: 'bill@csu.edu', password: "1234") }

before(:each) do
  visit '/'
  click_link "Login!"
  fill_in :email, with: 'george@csu.edu'
  fill_in :password, with: 'woodenteeth76'
  click_button "Submit"
end

  xit 'has a form to create a new party', :vcr do
    movie_id = 33
    movie_title = 'Unforgiven'
    visit "/users/movies/#{movie_id}/viewing-party/new?runtime=2.17"
    fill_in :duration, with: '300'
    fill_in :date, with: '2/2/2022'
    fill_in :start_time, with: '5:30'
    within "#user-#{user_1.id}" do
      check
    end
    within "#user-#{user_2.id}" do
      check
    end
    click_button 'Create Party'
    expect(current_path).to eq("/users")
    within "#hosting" do
    expect(page).to have_link("Unforgiven")
    click_link("Unforgiven")
    expect(current_path).to eq("/users/movies/#{movie_id}")
    end
  end

  it 'has a form to create a new party(sad path, duration too short)' do
    movie_id = 33
    movie_title = 'Unforgiven'
    visit "/users/movies/#{movie_id}/viewing-party/new?runtime=2.17"
    fill_in :duration, with: '120'
    fill_in :date, with: '2/2/2022'
    fill_in :start_time, with: '5:30'
    within "#user-#{user_1.id}" do
      check
    end
    within "#user-#{user_2.id}" do
      check
    end
    click_button 'Create Party'
    expect(current_path).to eq("/users/movies/#{movie_id}/viewing-party/new")
    expect(page).to have_content('The party must be longer than the movie, you silly goat!')
  end

  it 'has a form to create a new party(sad path, no friends invited)' do
    movie_id = 33
    movie_title = 'Unforgiven'
    visit "/users/movies/#{movie_id}/viewing-party/new?runtime=2.17"
    fill_in :duration, with: '500'
    fill_in :date, with: '2/2/2022'
    fill_in :start_time, with: '5:30'
    click_button 'Create Party'
    expect(current_path).to eq("/users/movies/#{movie_id}/viewing-party/new")
    expect(page).to have_content('You need to invite some friends! Try checking the boxes.')
  end
end
