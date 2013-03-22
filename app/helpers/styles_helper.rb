module StylesHelper
  def input_stylesheet
    @styles_array = Styles.all.map(&:style_name)
       end
  end

  def change_stylesheet
    if  user_signed_in? && current_user.style_id == Styles.first.id
      stylesheet_link_tag 'Light', :media => "all"
    elsif user_signed_in? && current_user.style_id != Styles.first.id
      stylesheet_link_tag 'Dark', :media => "all"
    else
      @default_style = stylesheet_link_tag 'Dark', :media => "all"
    end
  end

def add_style_id
  if user_signed_in?
    current_user.style_id = Styles.first.id
    current_user.save
  else
  end
end
