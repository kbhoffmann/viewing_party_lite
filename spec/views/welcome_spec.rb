require 'rails_helper'
RSpec.describe "the welcome page" do
  let!(:user_1) {User.create!(name: "George Washington", email: "george@csu.edu")}
  let!(:user_2) {User.create!(name: "Abe Lincoln", email: "honestabe@csu.edu")}


  it "shows the title of the application" do
    visit "/"
    expect(page).to have_content("Viewing Party!")
  end

  it "has a button to create a new user" do
    visit "/"
    expect(page).to have_button("Create a New User")
    #will change to clicking a button
  end

  it "shows all existing users" do
    visit "/"
    expect(page).to have_link(user_1.name)
    expect(page).to have_link(user_1.email)
    expect(page).to have_link(user_2.name)
    expect(page).to have_link(user_2.email)
  end

  it "has a link to go back to the landing page" do
    visit "/"
    click_link("Welcome Page")
    expect(current_path).to eq("/")
  end
end