module UsersHelper
  def my_page_link
    if user_signed_in?
      link_to 'My page', "/users/#{current_user.id}"
    else

    end
  end

  def user_register_link
    s = ''.html_safe
    s += '<li>'.html_safe
    if user_signed_in?
      @name = current_user.name
      s += link_to(t(:edit_user), edit_user_registration_path)
    elsif admin_signed_in?
      @name = 'Admin'
    else
      @name = 'Account'
      s +=  link_to(t(:sign_up), new_user_registration_path)
    end
  end

end
