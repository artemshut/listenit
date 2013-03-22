class AddUseriToAudios < ActiveRecord::Migration
  change_table "audios" do |t|
    t.integer "userid"
  end
end
