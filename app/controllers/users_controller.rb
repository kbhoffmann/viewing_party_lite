class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
      flash[:alert] = "Welcome #{user.name}! Your account has successfully been created!"
    else
      flash[:alert] = user.errors.full_messages.join('')
      redirect_to '/register'
    end
  end

  def show
    @user = User.find(params[:id])
      if @user.partys.length > 0
        @user.partys.each do |party|
          @movie = MovieFacade.movie_details_id(party.movie_id)
          if party.host_id != nil
          @host = User.find(party.host_id)
        end
      end
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     flash[:success] = "Welcome, #{user.name}!"
     redirect_to "/users/#{user.id}"
    elsif user && user.authenticate(params[:password]) == false
     flash[:error] = "Sorry, your credentials are bad."
     redirect_to "/login"
   elsif !user
     flash[:error] = "No user exists with email '#{params[:email]}'."
     redirect_to "/login"
   end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
