class Collection < ApplicationRecord
	belongs_to :owner, class_name: "User"

	has_many   :collection_resources
	has_many   :favorites, through: :collection_resources
	has_many   :resources, through: :favorites, source: :resource 

	validates  :name, :owner_id, presence: true 
end
