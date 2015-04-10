class StaticsController < ApplicationController

  def signup
    @cities = City.all
    @clubs  = Club.all
    @events = Event.all
    @users  = User.all
    @likes  = Like.all
  end

end