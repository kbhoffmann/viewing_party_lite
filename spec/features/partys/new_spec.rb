require 'rails_helper'
RSpec.describe "the new party page" do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu') }
  let!(:user_2) { User.create!(name: 'Billy Bo', email: 'bill@csu.edu') }


  it "has a form to create a new party(sad path)" do
    movie_id = 33
    movie_title = "Unforgiven"
    visit "/users/#{user_1.id}/movies/#{movie_id}/viewing-party/new?runtime=2.17"
    fill_in :duration, with: "300"
    fill_in :date, with: "2/2/2022"
    fill_in :start_time, with: "5:30"
    # check('George Washington(george@csu.edu)', allow_label_click: true)
    within "#user-#{user_1.id}" do
      check
    end
    within "#user-#{user_2.id}" do
      check
    end
    click_button "Create Party"
    expect(current_path).to eq("/users/#{user_1.id}")
  end

  it "has a form to create a new party(sad path)" do
    movie_id = 33
    movie_title = "Unforgiven"
    visit "/users/#{user_1.id}/movies/#{movie_id}/viewing-party/new?runtime=2.17"
    fill_in :duration, with: "120"
    fill_in :date, with: "2/2/2022"
    fill_in :start_time, with: "5:30"
    # check('George Washington(george@csu.edu)', allow_label_click: true)
    within "#user-#{user_1.id}" do
      check
    end
    within "#user-#{user_2.id}" do
      check
    end
    click_button "Create Party"
    expect(current_path).to eq("/users/#{user_1.id}/movies/#{movie_id}/viewing-party/new")
  end
end