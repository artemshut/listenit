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

  def stats
    g = Gruff::Line.new('580x210')
    g.theme = {
        :colors => ['#ff6600', '#3bb000', '#1e90ff', '#efba00', '#0aaafd'],
        :marker_color => '#aaa',
        :background_colors => ['#eaeaea', '#fff']
    }

    g.hide_title = true
    g.font = File.expand_path('path/to/font.ttf', RAILS_ROOT)

    range = "created_at #{(12.months.ago.to_date..Date.today).to_s(:db)}"
    @users = User.count(:all, :conditions => range, :group => "DATE_FORMAT(created_at, '%Y-%m')", :order =>"created_at ASC")
    @votes = Vote.count(:all, :conditions => range, :group => "DATE_FORMAT(created_at, '%Y-%m')", :order =>"created_at ASC")
    @bookmarks = Bookmark.count(:all, :conditions => range, :group => "DATE_FORMAT(created_at, '%Y-%m')", :order =>"created_at ASC")

    # Take the union of all keys & convert into a hash {1 => "month", 2 => "month2"...}
    # - This will be the x-axis.. representing the date range
    months = (@users.keys | @votes.keys | @bookmarks.keys).sort
    keys = Hash[*months.collect {|v| [months.index(v),v.to_s] }.flatten]

    # Plot the data - insert 0's for missing keys
    g.data("Users", keys.collect {|k,v| @users[v].nil? ? 0 : @users[v]})
    g.data("Votes", keys.collect {|k,v| @votes[v].nil? ? 0 : @votes[v]})
    g.data("Bookmarks", keys.collect {|k,v| @bookmarks[v].nil? ? 0 : @bookmarks[v]})

    g.labels = keys

    send_data(g.to_blob, :disposition => 'inline', :type => 'image/png', :filename => "site-stats.png")
  end
end


