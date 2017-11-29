class Review < ApplicationRecord
	belongs_to :author, class_name: "User"
	belongs_to :resource

	validates  :message, :evidence_rating, :useful_rating, :detail_rating, :recommend_rating, :author_id, :resource_id, presence: true 


	def rating_average
		rating = (self.evidence_rating + self.useful_rating + self.detail_rating + self.recommend_rating)/ 4
		"#{rating}/5"
	end

	def rating_number
		rating = (self.evidence_rating + self.useful_rating + self.detail_rating + self.recommend_rating)/ 4
	end
end


