class AddPlaylistToAudios < ActiveRecord::Migration
  def change
    change_table "audios" do |t|
      t.integer "playlist"
    end
  end
end
