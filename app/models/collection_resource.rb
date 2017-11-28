class CollectionResource < ApplicationRecord
	belongs_to :collection
	belongs_to :resource

	validates :collection_id, :resource_id, presence: true 
	validates_uniqueness_of :resource_id, :scope => [:collection_id]
end
