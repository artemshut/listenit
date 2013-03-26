class CreateAudiosUsers < ActiveRecord::Migration
  def change
    create_table :audios_users, :id => false do |t|
      t.integer :audio_id
      t.integer :user_id
      t.timestamps
    end
  end
end




