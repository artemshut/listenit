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

end
