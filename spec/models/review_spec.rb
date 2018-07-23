require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to validate_presence_of(:evidence_rating) }
  it { is_expected.to validate_presence_of(:useful_rating) }
  it { is_expected.to validate_presence_of(:detail_rating) }
  it { is_expected.to validate_presence_of(:recommend_rating) }
  it { is_expected.to validate_presence_of(:author_id) }
  it { is_expected.to validate_presence_of(:resource_id) }

  let(:author) { User.create(password: 'password', username: 'author1', email: 'author1@test.com') }
  let(:category) { Category.create(title: 'New Category') }
  let(:resource) { Resource.create(title: 'what',
                                description: 'whatwhat',
                                url: 'what.what.com',
                                author_id: author.id,
                                category_id: category.id) }
  let(:review) do
    described_class.create(message: 'huh',
                           evidence_rating: 3,
                           useful_rating: 3,
                           detail_rating: 3,
                           recommend_rating: 3,
                           author_id: author.id,
                           resource_id: resource.id)
  end

  describe '.rating_average' do
    it 'returns the rating average' do
      expect(review.rating_average).to eq('3/5')
    end
  end

  describe '.rating_number' do
    it 'returns the rating number' do
      expect(review.rating_number).to eq(3)
    end
  end
end
