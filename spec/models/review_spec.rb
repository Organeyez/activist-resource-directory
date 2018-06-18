require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to validate_presence_of(:message) }
  it { is_expected.to validate_presence_of(:evidence_rating) }
  it { is_expected.to validate_presence_of(:useful_rating) }
  it { is_expected.to validate_presence_of(:detail_rating) }
  it { is_expected.to validate_presence_of(:recommendation_rating) }
  it { is_expected.to validate_presence_of(:author_id) }
  it { is_expected.to validate_presence_of(:resource_id) }

  describe '.rating_average' do
  end

  describe '.rating_number' do
  end
end
