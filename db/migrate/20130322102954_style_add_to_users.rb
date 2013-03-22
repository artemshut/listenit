class StyleAddToUsers < ActiveRecord::Migration
  change_table "users" do |t|
    t.integer "style_id"
  end
end
