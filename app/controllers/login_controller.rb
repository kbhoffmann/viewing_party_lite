class LoginController < ApplicationController
  def index
    binding.pry
    @user = User.find_by(params[:email])
  end
end
