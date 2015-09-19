class User < ActiveRecord::Base
	
   has_secure_password

   attr_accessible :email, :username, :password , :password_confirmation, :first_name ,:last_name,:display_name

   validates_uniqueness_of :email , :username
   validates_presence_of :first_name, :last_name, :email, :display_name, :username
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


   has_many :posts, :foreign_key => 'author_id'
   has_many :recent_posts, :class_name => 'Post', 
				:order => 'created_at ASC', :limit => 5


   def full_name
      self.first_name+" " +self.last_name
   end

end
