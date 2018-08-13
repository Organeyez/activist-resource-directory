require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(password: 'password', username: 'username') }

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
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_inclusion_of(:admin).in_array([true, false]) }
  it { is_expected.to validate_inclusion_of(:subscribe).in_array([true, false]) }
end
