class UsersController < ApplicationController
  def new; end

  def login_form; end

  def login_user
    user = User.find_by(email: params[:email])

    if !user.nil?
      if user.authenticate(params[:password])
        redirect_to "/users/#{user.id}"
      end
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
      flash[:alert] = "Welcome #{user.name}! Your account has successfully been created!"
    else
      flash[:alert] = user.errors.full_messages.to_sentence

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

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
