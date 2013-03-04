class SessionsController < ApplicationController
  def destroy
    sign_out
    redirect_to root_path
    flash.now
  end
end
