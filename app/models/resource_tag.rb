class ResourceTag < ApplicationRecord
	belongs_to :resource
	belongs_to :tag

	validates :resource_id, :tag_id, presence: true 
end
