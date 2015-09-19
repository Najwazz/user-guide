class AddStatus < ActiveRecord::Migration
  def self.up
	add_column :posts, :status, :string, 	 :limit => 20,  :default => "", :null => false
  end

  def self.down
	remove_column :posts, :status
  end
end
