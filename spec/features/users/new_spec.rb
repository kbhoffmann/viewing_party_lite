require 'rails_helper'

RSpec.describe 'New User Form' do
  it 'creates a new user' do
    visit '/register'
    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'bobbybob@gmail.com'
    fill_in 'Password', with: 'pw123'
    fill_in "Password Confirmation", with: 'pw123'
    click_button 'Submit'

    last_user = User.all.last
    expect(current_path).to eq("/users/#{last_user.id}")
    expect(page).to have_content("#{last_user.name}'s Dashboard")
  end

  it 'shows a welcome/success message on the when user registration successful' do
    visit '/register'
    fill_in 'Name', with: 'Mike'
    fill_in 'Email', with: 'mikey@gmail.com'
    fill_in 'Password', with: 'pw123'
    fill_in "Password Confirmation", with: 'pw123'
    click_button 'Submit'
    new_user = User.last
    expect(current_path).to eq("/users/#{new_user.id}")
    expect(page).to have_content("Welcome #{new_user.name}! Your account has successfully been created!")
  end

  it 'wont create a user with a duplicate email' do
    user_1 = User.create!(name: 'Bob', email: 'bobbybob@gmail.com', password: "test123", password_digest: "test123")
    visit '/register'
    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'bobbybob@gmail.com'
    fill_in 'Password', with: 'pw123'
    fill_in "Password Confirmation", with: 'pw123'
    click_button 'Submit'
    expect(current_path).to eq('/register')
    expect(page).to have_content('Email has already been taken')
    expect(User.all.count).to eq(1)
  end

  it 'wont create a user without a name' do
    user_1 = User.create!(name: 'User', email: 'user@gmail.com', password: "test123", password_digest: "test123")

    visit '/register'

    fill_in 'Name', with: ""
    fill_in 'Email', with: 'bobbybob@gmail.com'
    fill_in 'Password', with: 'pw123'
    fill_in "Password Confirmation", with: 'pw123'
    click_button 'Submit'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Name can't be blank")
    expect(User.all.count).to eq(1)
  end

  it 'wont create a user without a matching password confirmation' do
    user_1 = User.create!(name: 'User', email: 'user@gmail.com', password: "test123", password_digest: "test123")

    visit '/register'

    fill_in 'Name', with: 'Bob'
    fill_in 'Email', with: 'bobbybob@gmail.com'
    fill_in 'Password', with: 'pw123'
    fill_in "Password Confirmation", with: 'PW123'
    click_button 'Submit'

    expect(current_path).to eq('/register')
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(User.all.count).to eq(1)
  end
end
