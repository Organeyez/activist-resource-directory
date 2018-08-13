require 'rails_helper'

RSpec.describe Collection, type: :model do
  it { is_expected.to have_many(:collection_resources) }
  it { is_expected.to have_many(:resources) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:owner_id) }
  it { is_expected.to validate_length_of(:name) }
end
