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

 /* def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => I18n.locale }
  end */
end
