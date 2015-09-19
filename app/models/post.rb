class Post < ActiveRecord::Base

    attr_accessible :body, :title, :tags , :author_id, :created_at,:categories,:status
    has_attached_file :file

	belongs_to :author, :class_name => 'User', 
						:foreign_key => 'author_id', 
						:counter_cache => true
	
	has_many :categorizations
	has_many :categories, :through => :categorizations

	validates_presence_of :title, :body, :tags 
	
	
end
