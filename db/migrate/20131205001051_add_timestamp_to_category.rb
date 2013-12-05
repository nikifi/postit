class AddTimestampToCategory < ActiveRecord::Migration
  def change
     add_timestamps(:categories)
  end
end
