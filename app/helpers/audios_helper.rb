module AudiosHelper

  def user_playlist
  Audio.all.each do |audio|
    if audio.userid == current_user.id

    end
  end
  end
end
