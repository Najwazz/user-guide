
#rake db:migrate

class CreatePosts < ActiveRecord::Migration
   def self.up
    create_table :posts do |t|
		t.column :title, :string, 	 :limit => 100, :default => "", :null => false
		t.column :body, :text, 						:default => "", :null => false
		t.column :author_id, :integer, :default => 0, :null => false
		t.column :category, :string, :limit => 20,  :default => "", :null => false
		t.column :tags, :string, 	 :limit => 120,  :default => "", :null => false
	    end
	add_index :posts, :author_id
  end

  def self.down
    drop_table :posts
  end
end

