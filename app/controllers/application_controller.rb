class ApplicationController < ActionController::Base
  before_filter :set_locale

  def set_locale
    if user_signed_in?
      I18n.locale = params[:locale] || current_user.locale
     # redirect_to root_path
    else
      I18n.locale = params[:locale] || I18n.default_locale
    end
  end


end
