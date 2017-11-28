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
end
