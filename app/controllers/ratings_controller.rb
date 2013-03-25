class RatingsController < ApplicationController
  def rate
    @audio = Audio.find(params[:id])
    @rating = Rating.create!(:rateable_type => "audio", :user_id => current_user, :rating => params[:rating1], :rateable_id =>@audio.id)
end
end

