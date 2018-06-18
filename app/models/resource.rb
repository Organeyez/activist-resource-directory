class Resource < ApplicationRecord
  belongs_to  :category
  belongs_to  :author, class_name: 'User'

  has_many  :resource_tags
  has_many  :tags, through: :resource_tags
  has_many  :resources, through: :resource_tags
  has_many  :collection_resources
  has_many  :favorites
  has_many  :fans, through: :favorites
  has_many  :reviews
  has_many  :reviewers, through: :reviews, source: :author

  validates :title, :description, :url, :author_id, :category_id, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }

  def total_fans
    fans.count
  end

  def average_rating
    sum = 0
    count = reviews.length
    reviews.each do |review|
      sum += review.rating_number
    end
    if count > 0
      "#{sum / count}/5 Average Rating"
    else
      'No ratings yet'
    end
  end

  def self.search(search)
    where('lower(title) LIKE ?', "%#{search.downcase}%")
    where('lower(description) LIKE ?', "%#{search.downcase}%")
  end

  # TODO: Move tag addition logic here from controller.
  # def add_tag(tag)
  # end
end
