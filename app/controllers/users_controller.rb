class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end
  def index
    @users = User.all
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t(:user_destroy)
    redirect_to users_path
  end

end
