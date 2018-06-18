require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { is_expected.to belong_to(:resource) }
  it { is_expected.to belong_to(:fan) }
  it { is_expected.to have_many(:collection_resources) }
  it { is_expected.to validate_presence_of(:resource_id) }
  it { is_expected.to validate_presence_of(:fan_id) }
end
