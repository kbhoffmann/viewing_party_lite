require 'rails_helper'
RSpec.describe 'the welcome page' do
  let!(:user_1) { User.create!(name: 'George Washington', email: 'george@csu.edu', password: 'pw123', password_confirmation: 'pw123') }
  let!(:user_2) { User.create!(name: 'Abe Lincoln', email: 'honestabe@csu.edu', password: 'PW123', password_confirmation: 'PW123') }

  it 'shows the title of the application' do
    visit '/'
    expect(page).to have_content('Viewing Party!')
  end

  it 'has a button to create a new user' do
    visit '/'
    expect(page).to have_button('Create a New User')
    click_on 'Create a New User'
    expect(current_path).to eq('/register')
    # will change to clicking a button
  end

  it 'shows all existing users and routes to their dashboard' do
    visit '/'
    expect(page).to have_link(user_1.name)
    expect(page).to have_link(user_2.name)
    click_link(user_1.name)
    expect(current_path).to eq("/users/#{user_1.id}")
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
end
