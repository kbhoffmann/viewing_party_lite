require 'rails_helper'

RSpec.describe "Login Page" do
  it 'directs an existing user to their dashboard with successful login' do
    kerri_user = User.create!(name: 'Kerri', email: 'kerri@turing.edu', password: 'pw123', password_confirmation: 'pw123')

    visit '/login'

    fill_in "Email", with: 'kerri@turing.edu'
    fill_in "Password", with: 'pw123'
    click_on "Login"

    expect(current_path).to eq("/users/#{kerri_user.id}")
  end

  it 'directs a user back to the login page if a non-existant email is entered and flashes a message' do
    kerri_user = User.create!(name: 'Kerri', email: 'kerri@turing.edu', password: 'pw123', password_confirmation: 'pw123')
    visit '/login'

    fill_in "Email", with: 'KerriH@gmail.edu'
    fill_in "Password", with: 'pw123'
    click_on "Login"

    expect(current_path).to eq("/login")
    expect(page).to have_content("Unable to find a user with that password")
  end

  it 'directs a user back to the login page if an incorrect password is entered and flashes a message' do
    kerri_user = User.create!(name: 'Kerri', email: 'kerri@turing.edu', password: 'pw123', password_confirmation: 'pw123')
    visit '/login'

    fill_in "Email", with: 'kerri@turing.edu'
    fill_in "Password", with: 'password123'
    click_on "Login"

    expect(current_path).to eq("/login")
    expect(page).to have_content("Password is invalid, try again")
  end
end
