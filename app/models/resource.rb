class Resource < ApplicationRecord
	belongs_to 	:category
	belongs_to 	:author, class_name: "User"

	has_many 	:resource_tags
	has_many	:tags, through: :resource_tags
	has_many	:resources, through: :resource_tags
	has_many    :collection_resources 
	has_many	:favorites
	has_many	:fans, through: :favorites 
	has_many	:reviews 
	has_many	:reviewers, through: :reviews, source: :author

	validates :title, :description, :url, :author_id, :category_id, presence: true 
	validates :title, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }

	def total_fans
		self.fans.count 
	end

	def average_rating
		sum = 0 
		count = self.reviews.length 
		self.reviews.each do |review|
			sum += review.rating_number 
		end
		if count > 0
			"#{sum/count}/5 Average Rating" 
		else 
			"No ratings yet"
		end
	end

end
