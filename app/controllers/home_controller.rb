class HomeController < ApplicationController
  def index
     @title = "Welcome to the Hollywood"
  end
  def search
    query = params[:search]

    @results = User.find_by_name(query)

  end


end
