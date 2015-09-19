class Category < ActiveRecord::Base

    attr_accessible :name, :description

	has_many :categorizations
	has_many :posts, :through => :categorizations

	validates_presence_of :name, :description
	validates_length_of :name, :within => 3..50
	validates_length_of :description, :maximum => 1000

end
