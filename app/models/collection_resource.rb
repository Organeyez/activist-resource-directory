class CollectionResource < ApplicationRecord
	belongs_to :collection
	belongs_to :favorite

	validates :collection_id, :favorite_id, presence: true 
end
