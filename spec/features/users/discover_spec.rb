require 'rails_helper'

RSpec.describe 'Discover page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: 'pw123', password_confirmation: 'pw123') }

  before :each do
    visit '/login'
    fill_in :email, with: 'george@csu.edu'
    fill_in :password, with: 'pw123'
    click_on "Login"
  end

  it 'has a title called discover movies' do
    visit "/discover"

    expect(page).to have_content('Discover Movies')
  end

  it 'has a button to find top rated movies', :vcr do
    visit "/discover"

    click_button('Find Top Rated Movies')
    expect(current_path).to eq("/movies")
    expect(page).to have_content('Your Eyes Tell')
    # expect(page).to have_content('8.8')
  end

  it 'a form to find movies', :vcr do
    visit "/discover"

    fill_in :title, with: 'The Patriot'
    click_button('Find Movies')
  end
end
