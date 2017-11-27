class Tag < ApplicationRecord
	has_many :resource_tags 

	validates :name, presence: true 
	validates :name, uniqueness: true 
end
