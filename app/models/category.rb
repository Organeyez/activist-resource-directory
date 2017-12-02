class Category < ApplicationRecord
	has_many :resources

	validates :title, presence: true 
end
