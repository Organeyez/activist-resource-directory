require 'rails_helper'
require 'pry'

RSpec.describe Resource, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to belong_to(:author) }
  it { is_expected.to have_many(:resource_tags) }
  it { is_expected.to have_many(:tags) }
  it { is_expected.to have_many(:resources) }
  it { is_expected.to have_many(:collection_resources) }
  it { is_expected.to have_many(:favorites) }
  it { is_expected.to have_many(:fans) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to have_many(:reviewers) }
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:author_id) }
  it { is_expected.to validate_presence_of(:category_id) }
  it { is_expected.to validate_length_of(:title) }
  it { is_expected.to validate_length_of(:description) }

  let(:author) { User.create(password: 'password', username: 'author1', email: 'author1@test.com') }
  let(:fan1) { User.create(password: 'password', username: 'user1', email: 'user1@test.com') }
  let(:fan2) { User.create(password: 'password', username: 'user2', email: 'user2@test.com') }
  let(:category) { Category.create(title: 'New Category') }
  let(:resource) { Resource.create(title: 'what',
                                description: 'whatwhat',
                                url: 'what.what.com',
                                author_id: author.id,
                                category_id: category.id) }

  let!(:favorite) { Favorite.create(resource_id: resource.id,  fan_id: fan1.id) }
  let!(:favorite2) { Favorite.create(resource_id: resource.id, fan_id: fan2.id) }

  describe '.total_fans' do
    it 'returns the total number of users who have favorited the resource' do
      expect(resource.total_fans).to eq(2)
    end
  end

  describe '.average_rating' do
    it 'it returns "no review yet" when thre are no reviews for the resource' do
      expect(resource.average_rating).to eq('No ratings yet')
    end

    it 'returns the average rating for the resource when there are reviews' do
      review = Review.create(message: 'huh',
                             evidence_rating: 3,
                             useful_rating: 3,
                             detail_rating: 3,
                             recommend_rating: 3,
                             author_id: author.id,
                             resource_id: resource.id)
      expect(resource.average_rating).to eq('3/5 Average Rating')
    end
  end

  describe '.search' do
  end
end
