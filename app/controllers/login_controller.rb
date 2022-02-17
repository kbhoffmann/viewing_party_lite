class LoginController < ApplicationController
  def index
    @user = User.find_by(params[:email])
  end
end
