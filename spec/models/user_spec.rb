require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:posted_resources) }
  it { is_expected.to have_many(:favorites) }
  it { is_expected.to have_many(:favorited_resources) }
  it { is_expected.to have_many(:collections) }
  it { is_expected.to have_many(:reviews) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_length_of(:password) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:username) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_inclusion_of(:admin) }
  it { is_expected.to validate_inclusion_of(:subscribe) }
end
