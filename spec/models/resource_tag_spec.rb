require 'rails_helper'

RSpec.describe ResourceTag, type: :model do
  it { is_expected.to belong_to(:resource) }
  it { is_expected.to belong_to(:tag) }
  it { is_expected.to validate_presence_of(:resource_id) }
  it { is_expected.to validate_presence_of(:tag_id) }
  it { is_expected.to validate_uniqueness_of(:tag_id) }
end
