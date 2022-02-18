class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/dashboard"
      flash[:alert] = "Welcome #{user.name}! Your account has successfully been created!"
      session[:user_id] = user.id
    else
      flash[:alert] = user.errors.full_messages.join('')
      redirect_to '/register'
    end
  end

  def show
    if params[:email]
      @user = User.find_by(email: params[:email])
    else
    @user = User.find_by(id: session[:user_id])
      if @user && @user.partys.length > 0
        @user.partys.each do |party|
          @movie = MovieFacade.movie_details_id(party.movie_id)
          if party.host_id != nil
          @host = User.find(party.host_id)
          end
        end
      end
    end
  end

  def discover
    @user = User.find_by(id: session[:user_id])
  end

  def login_form
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     flash[:success] = "Welcome, #{user.name}!"
     redirect_to "/users/dashboard"
    elsif user && user.authenticate(params[:password]) == false
     flash[:error] = "Sorry, your credentials are bad."
     redirect_to "/login"
    elsif !user
     flash[:error] = "No user exists with email '#{params[:email]}'."
     redirect_to "/login"
   end
  end

  def logout
    session.destroy
    redirect_to "/"
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
