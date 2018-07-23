require 'rails_helper'

RSpec.describe CollectionResource, type: :model do
  it { is_expected.to validate_presence_of(:collection_id) }
  it { is_expected.to validate_presence_of(:resource_id) }
end
