class Review < ApplicationRecord
	belongs_to :author, class_name: "User"
	belongs_to :resource

	validates :message, :rating, presence: true 
end
