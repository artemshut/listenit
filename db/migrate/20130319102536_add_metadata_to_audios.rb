class AddMetadataToAudios < ActiveRecord::Migration
  change_table "audios" do |t|
    t.string "metadata"
  end
end
