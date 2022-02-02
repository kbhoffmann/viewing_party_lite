require 'rails_helper'

RSpec.describe "Discover page" do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu') }

  it 'has a title called discover movies' do
     visit "/users/#{user_1.id}/discover"
     expect(page).to have_content("Discover Movies")
  end

  it 'has a button to find top rated movies', :vcr do
     visit "/users/#{user_1.id}/discover"
     click_button("Find Top Rated Movies")
     expect(current_path).to eq("/users/#{user_1.id}/movies")
     expect(page).to have_content("Your Eyes Tell")
     expect(page).to have_content("8.8")
  end

  it 'a form to find movies' do
     visit "/users/#{user_1.id}/discover"
     expect(page).to have_button("Find Movies")
  end
end
