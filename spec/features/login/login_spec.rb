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
end
