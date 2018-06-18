class Favorite < ApplicationRecord
  belongs_to  :resource
  belongs_to  :fan, class_name: 'User'
  has_many  :collection_resources

  validates :resource_id, :fan_id, presence: true
end
