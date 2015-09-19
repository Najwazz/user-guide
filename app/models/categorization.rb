class Categorization < ActiveRecord::Base
	set_table_name "categories_posts"
	belongs_to :post
	belongs_to :category
end
