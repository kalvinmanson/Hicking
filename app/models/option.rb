class Option < ActiveRecord::Base

	has_and_belongs_to_many :categories, :before_add => :validates_category

	def validates_category(category)
		raise ActiveRecord::Rollback if self.categories.include? category
	end
end
