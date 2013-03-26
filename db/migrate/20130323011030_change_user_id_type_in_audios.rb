class ChangeUserIdTypeInAudios < ActiveRecord::Migration
  def self.up
    connection.execute(%q{
    alter table audios
    alter column user_id
    type integer using cast(user_id as integer)
  })
  end

  def self.down
    change_column :audios, :user_id, :string
  end
end
