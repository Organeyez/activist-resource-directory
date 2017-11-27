class ResourceTag < ApplicationRecord
	belongs_to :resource
	belongs_to :tag

	validates :resource_id, :tag_id, presence: true 
	validates_uniqueness_of :tag_id, :scope => [:resource_id]
end
