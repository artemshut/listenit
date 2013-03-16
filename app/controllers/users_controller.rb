class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def index
    @title = "All users"
    @users = User.all
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  def search
    query = params[:search]
    @results = User.find_by_name(query)
  end

end
