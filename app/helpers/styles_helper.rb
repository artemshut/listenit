module StylesHelper
  def input_stylesheet_name
    @styles_array_name = Styles.all.map(&:style_name)
  end

  def input_stylesheet_id
    @styles_array_id = Styles.all.map(&:id)
  end


  def change_stylesheet
    if user_signed_in? && current_user.style_id == Styles.first.id
      stylesheet_link_tag 'Dark', :media => "all"
    elsif user_signed_in? && current_user.style_id != Styles.first.id
      stylesheet_link_tag 'Light', :media => "all"
    else
      @default_style = stylesheet_link_tag 'Dark', :media => "all"
    end
  end

  def add_style_id_light
    if user_signed_in?
      current_user.send(:update, [current_user.style_id = input_stylesheet_id[0]])
    end
  end

  def add_style_id_dark
   if user_signed_in?
     current_user.send(:update, [current_user.style_id = input_stylesheet_id[1]])
   end
  end
end
