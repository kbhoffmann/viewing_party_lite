require 'rails_helper'
RSpec.describe 'the welcome page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: "woodenteeth76") }
  let!(:user_2) { User.create!(name: 'Abe Lincoln', email: 'honestabe@csu.edu', password: "1234") }

  it 'shows the title of the application' do
    visit '/'
    expect(page).to have_content('Viewing Party!')
  end

  it 'has a button to create a new user' do
    visit '/'
    expect(page).to have_button('Create a New User')
    click_on 'Create a New User'
    expect(current_path).to eq('/register')
  end

  it 'shows all existing users and routes to their dashboard' do
    visit '/'
    expect(page).to have_link(user_1.name)
    expect(page).to have_link(user_1.email)
    expect(page).to have_link(user_2.name)
    expect(page).to have_link(user_2.email)
    click_link(user_1.name)
    expect(current_path).to eq("/users/dashboard")
  end

  it 'has a link to go back to the landing page' do
    visit '/'
    click_link('Welcome Page')
    expect(current_path).to eq('/')
  end

  it "has a link thats logs user in" do
    visit '/'
    click_link "Login!"
    expect(current_path).to eq("/login")
    fill_in :email, with: 'george@csu.edu'
    fill_in :password, with: 'woodenteeth76'
    click_button "Submit"
    expect(current_path).to eq("/users/dashboard")
  end

  it "has a link thats logs user in(sad path wrong PW)" do
    visit '/'
    click_link "Login!"
    expect(current_path).to eq("/login")
    fill_in :email, with: 'george@csu.edu'
    fill_in :password, with: 'shbcdsbhdbshcdhsbhsdbh'
    click_button "Submit"
    expect(current_path).to eq("/login")
    expect(page).to have_content("Sorry, your credentials are bad.")
  end

  it "has a link thats logs user in(sad path no email matches)" do
      visit '/'
      click_link "Login!"
      expect(current_path).to eq("/login")
      fill_in :email, with: 'george@msu.edu'
      fill_in :password, with: 'woodenteeth76'
      click_button "Submit"
      expect(current_path).to eq("/login")
      expect(page).to have_content("No user exists with email 'george@msu.edu'.")
  end

  it "has link to log out if logged in" do
    visit '/'
    click_link "Login!"
    fill_in :email, with: 'george@csu.edu'
    fill_in :password, with: 'woodenteeth76'
    click_button "Submit"
    expect(current_path).to eq("/users/dashboard")
    click_link "Welcome Page"
    click_link "Logout"
    expect(current_path).to eq("/")
    expect(page).to have_content("Login!")
  end
end
