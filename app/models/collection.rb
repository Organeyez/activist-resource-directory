class Collection < ApplicationRecord
	belongs_to :owner, class_name: "User"

	has_many   :collection_resources
	has_many   :resources, through: :collection_resources, source: :resource

	validates  :name, :owner_id, presence: true 
	validates  :name, length: { maximum: 30 }

  
  # TODO: Add more validations
  # PROFANITY = ["boom", "bar", "baz"]
  # validates :name, not_in: PROFANITY, message: "You can't use this name"
end
