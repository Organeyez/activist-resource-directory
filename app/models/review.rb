class Review < ApplicationRecord
	belongs_to :author, class_name: "User"
	belongs_to :resource

	validates  :message, :evidence_rating, :useful_rating, :detail_rating, :recommend_rating, :author_id, :resource_id, presence: true 


	# def overall_rating
	# end
end


