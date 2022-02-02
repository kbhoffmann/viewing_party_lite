require 'rails_helper'

RSpec.describe "Movie Index Page" do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu') }

  it 'has a button to return to the discover page', :vcr do
    visit "/users/#{user_1.id}/movies"
    
    click_button "Discover Page"

    expect(current_path).to eq("/users/#{user_1.id}/discover")
  end
end
