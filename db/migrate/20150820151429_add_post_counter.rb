class AddPostCounter < ActiveRecord::Migration
   def self.up
	add_column :users, :posts_count, :integer, :limit => 6, :default => 0, :null => false
  end

  def self.down
	remove_column :users, :posts_count
  end
end
