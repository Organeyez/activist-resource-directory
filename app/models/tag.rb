class Tag < ApplicationRecord
  has_many :resource_tags

  validates :name, presence: true, length: { maximum: 20 }
  validates :name, uniqueness: true
end

