class Favorite < ApplicationRecord
  belongs_to  :resource
  belongs_to  :fan, class_name: 'User'

  # TODO: add favorite_id foreign key to collection resources for the below to be true
  # has_many  :collection_resources

  validates :resource_id, :fan_id, presence: true
end
