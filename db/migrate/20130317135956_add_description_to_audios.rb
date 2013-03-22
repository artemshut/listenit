class AddDescriptionToAudios < ActiveRecord::Migration
  def change
  change_table "audios" do |t|
    t.string "description"
    end
  end

end
