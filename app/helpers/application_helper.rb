module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def user_register_link
    s = ''.html_safe
    s += '<li>'.html_safe
    if user_signed_in?

      s += link_to(t(:edit_user), edit_user_registration_path)
      @name = current_user.name
    elsif admin_signed_in?
      @name = 'Admin'
    else
      @name = 'Account'
      s +=  link_to(t(:sign_up), new_user_registration_path)
    end
  end
end
