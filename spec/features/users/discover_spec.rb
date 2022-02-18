require 'rails_helper'

RSpec.describe 'Discover page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: "1234") }

  before(:each) do
      visit '/'
      click_link "Login!"
      expect(current_path).to eq("/login")
      fill_in :email, with: 'george@csu.edu'
      fill_in :password, with: 'woodenteeth76'
      click_button "Submit"
    end

  it 'has a title called discover movies' do
    visit "/users/discover"
    expect(page).to have_content('Discover Movies')
  end

  it 'has a button to find top rated movies', :vcr do
    visit "/users/discover"
    click_button('Find Top Rated Movies')
    expect(current_path).to eq("/users/movies")
    expect(page).to have_content('Your Eyes Tell')
  end

  it 'a form to find movies', :vcr do
    visit "/users/discover"
    fill_in :title, with: 'The Patriot'
    click_button('Find Movies')
  end
end
