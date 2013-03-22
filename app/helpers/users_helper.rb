module UsersHelper
  def my_page_link
    if user_signed_in?
      link_to 'My page', "/users/#{current_user.id}"
    else

    end
  end
end
