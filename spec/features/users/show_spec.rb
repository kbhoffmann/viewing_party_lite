require 'rails_helper'
RSpec.describe 'the user show(dashboard) page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: "woodenteeth76") }
  let!(:party_1) do
    Party.create!(movie_id: 33, date: Time.new(2022, 2, 1), duration: 120, start_time: Time.new(2022, 2, 1, 10, 30, 2))
  end
  let!(:party_2) do
    Party.create!(movie_id: 33, date: Time.new(2022, 2, 1), duration: 50, start_time: Time.new(2022, 2, 1, 10, 30, 2),
                  host_id: user_1.id)
  end
  let!(:user_party_1) { UserParty.create!(user_id: user_1.id, party_id: party_1.id) }
  let!(:user_party_2) { UserParty.create!(user_id: user_1.id, party_id: party_2.id) }

  before(:each) do
        visit '/'
        click_link "Login!"
        expect(current_path).to eq("/login")
        fill_in :email, with: 'george@csu.edu'
        fill_in :password, with: 'woodenteeth76'
        click_button "Submit"
  end 

  it "displays the user's dashboard", :vcr do
    visit "/users/dashboard"
    expect(page).to have_content("George Washington's Dashboard")
  end

  it 'has a button to discover movies', :vcr do
    visit "/users/dashboard"

    click_button('Discover Movies')
    expect(current_path).to eq("/users/discover")
  end

  it 'has all the details of the party the user is invited to', :vcr do
    visit "/users/dashboard"

    within('#invited') do
      expect(page).to have_content('Date: 02/01/2022')
      expect(page).to have_content('Duration: 120')
      expect(page).to have_content('Start Time: 05:30 PM')
    end
  end

  it 'shows the parties where the user is a host', :vcr do
    visit "/users/dashboard"

    within('#hosting') do
      expect(page).to have_content('Date: 02/01/2022')
      expect(page).to have_content('Duration: 50')
      expect(page).to have_content('Start Time: 05:30 PM')
    end
  end
end
