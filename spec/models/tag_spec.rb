require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { described_class.new(name: 'tag') }

  it { is_expected.to have_many(:resource_tags) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
