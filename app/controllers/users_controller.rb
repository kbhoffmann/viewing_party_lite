class UsersController < ApplicationController
  def new; end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email])
    if user
      #could just make if user && user.authenticate() with just one flash error.
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/dashboard"
      else
        redirect_to "/login"
        flash[:alert] = "Password is invalid, try again"
      end
    else
      redirect_to "/login"
      flash[:alert] = "Unable to find a user with that password"
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to "/dashboard"
      flash[:alert] = "Welcome #{user.name}! Your account has successfully been created!"
    else
      flash[:alert] = user.errors.full_messages.to_sentence

      redirect_to '/register'
    end
  end

  def show
    @user = User.find(session[:user_id])

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
    @user = User.find(session[:user_id])
  end

  def logout_user
    session.destroy

    redirect_to '/'
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
