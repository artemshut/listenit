class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :audio
      t.has_attached_file :audio
      t.timestamps
    end
  end
end
