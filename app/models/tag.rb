class Tag < ApplicationRecord
	has_many :resource_tags 

	validates :title, presence: true 
end
