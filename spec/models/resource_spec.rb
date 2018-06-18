require 'rails_helper'

RSpec.describe User, type: :model do
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


  decribe '.total_fans' do
  end

  describe '.average_rating' do
  end

  describe '.search' do
  end
end
