class PartysController < ApplicationController

  def new
    @user = User.find(params[:id])
    @users = User.all
    @movie = NewMovieParty.new(params[:movie_id], params[:title], params[:runtime] )
    #poro for the new form
  end

  def create
    if params[:duration].to_i < params[:runtime].to_i
      redirect_to "/users/#{params[:id]}/movies/#{params[:movie_id]}/viewing-party/new?runtime=#{params[:runtime]}"
      flash.alert = "The party must be longer than the movie, you silly goat!"
    elsif params[:users] == nil
      flash.alert = "You need to invite some friends! Try checking the boxes."
      redirect_to "/users/#{params[:id]}/movies/#{params[:movie_id]}/viewing-party/new?runtime=#{params[:runtime]}"
    else
      party = Party.create!(
        movie_id: params[:movie_id],
        host_id: params[:id].to_i,
        date: params[:date].to_datetime,
        start_time: params[:start_time].to_datetime,
        duration: params[:duration])

        params[:users].each do |id|
          UserParty.create!(user_id: id, party_id: party.id)
      end
      redirect_to "/users/#{params[:id]}"
    end
  end
end
