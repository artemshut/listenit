module UsersHelper
  def my_page_link
    if user_signed_in?
      link_to t(:my_page), "/users/#{current_user.id}"
    end
  end

  def user_register_link
    s = ''.html_safe
    s += '<li>'.html_safe
    if user_signed_in?
      s += link_to(t(:music), audios_path)
      s += link_to(t(:edit_user), edit_user_registration_path)
      s += link_to(t(:logout), destroy_user_session_path)
    elsif admin_signed_in?
      s += link_to(t(:users_list), users_path)
      s +=  link_to(t(:logout), destroy_admin_session_path)
    else
      s +=  link_to(t(:sign_up), new_user_registration_path)
      s += link_to(t(:sign_in), new_user_session_path)
      s += link_to(t(:admin) , new_admin_session_path)
    end
  end
end


