require 'rails_helper'

RSpec.describe 'New User Form' do
  it 'creates a new user' do
    visit '/register'
    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'bobbybob@gmail.com'
    fill_in 'Password', with: "normanthecat"
    fill_in 'Password confirmation', with: "normanthecat"
    click_button 'Submit'
    last_user = User.all.last
    expect(current_path).to eq("/users/dashboard")
    expect(page).to have_content("#{last_user.name}'s Dashboard")
  end

  it 'shows a welcome/success message on the when user registration successful' do
    user_1 = User.create!(name: 'Mike', email: 'mikey26@gmail.com', password: "normanthecat")
    visit '/register'
    fill_in 'Name', with: 'Mike'
    fill_in 'Email', with: 'mikey@gmail.com'
    fill_in 'Password', with: "normanthecat"
    fill_in 'Password confirmation', with: "normanthecat"
    click_button 'Submit'
    new_user = User.last
    expect(current_path).to eq("/users/dashboard")
    expect(page).to have_content("Welcome #{new_user.name}! Your account has successfully been created!")
  end

  it 'wont create a user with a duplicate email' do
    user_1 = User.create!(name: 'Bob', email: 'bobbybob@gmail.com', password: "normanthecat")
    visit '/register'
    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'bobbybob@gmail.com'
    fill_in 'Password', with: "normanthecat"
    fill_in 'Password confirmation', with: "normanthecat"
    click_button 'Submit'
    expect(current_path).to eq('/register')
    expect(page).to have_content('Email has already been taken')
    expect(User.all.count).to eq(1)
  end

  it 'wont create a user when passwords do not match' do
    user_1 = User.create!(name: 'Bob', email: 'bobbybob@gmail.com', password: "normanthecat")
    visit '/register'
    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'norman@gmail.com'
    fill_in 'Password', with: "normanthecat"
    fill_in 'Password confirmation', with: "password"
    click_button 'Submit'
    expect(current_path).to eq('/register')
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.all.count).to eq(1)
  end
end
