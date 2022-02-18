require 'rails_helper'
RSpec.describe 'the welcome page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: 'pw123', password_confirmation: 'pw123') }
  let!(:user_2) { User.create!(name: 'Abe Lincoln', email: 'honestabe@csu.edu', password: 'PW123', password_confirmation: 'PW123') }

  it 'shows the title of the application' do
    visit '/'
    expect(page).to have_content('Welcome to Viewing Party!')
  end

  it 'has a button to create a new user' do
    visit '/'
    expect(page).to have_button('Create a New User')
    click_on 'Create a New User'
    expect(current_path).to eq('/register')
  end

  xit 'shows all existing users and routes to their dashboard' do
    visit '/'
    
    expect(page).to have_link(user_1.name)
    expect(page).to have_link(user_2.name)
    click_link(user_1.name)
    expect(current_path).to eq("/dashboard")
    #need to change in controller that users are visible on '/' without being logged in
  end

  it 'has a link to go back to the landing page' do
    visit '/'

    click_link('Welcome Page')

    expect(current_path).to eq('/')
  end

  it 'links to the login page' do
    visit '/'

    click_link "Log In"

    expect(current_path).to eq('/login')
  end

  it 'after a user has logged in, it instead has a link to log out' do
    visit '/'
    expect(page).to_not have_link("Log Out")

    visit '/login'
    fill_in :email, with: 'george@csu.edu'
    fill_in :password, with: 'pw123'
    click_on "Login"

    visit '/'

    expect(page).to_not have_button("Create a New User")
    expect(page).to_not have_link("Log In")

    click_link "Log Out"

    expect(current_path).to eq('/')
    expect(page).to have_button("Create a New User")
    expect(page).to have_link("Log In")
  end
end
