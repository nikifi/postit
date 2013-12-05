class AddTimestampToTables < ActiveRecord::Migration
  def change
    add_timestamps(:comments)
    add_timestamps(:posts)
    add_timestamps(:users)
  end
end
