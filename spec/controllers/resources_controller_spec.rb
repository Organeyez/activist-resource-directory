require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  let(:owner) { User.create(password: 'password', username: 'owner1', email: 'owner1@test.com') }
  let(:category1) { Category.create(title: 'Environment') }
  let(:resource1) do
    Resource.create(title: 'what is happening',
                    description: 'whatwhatwhat',
                    url: 'what.what.com',
                    author_id: owner.id,
                    category_id: category1.id)
  end

  let(:resource2) do
    Resource.create(title: 'where is stuff happening',
                    description: 'whatwhat',
                    url: 'where.what.com',
                    author_id: owner.id,
                    category_id: category1.id)
  end

  describe '#index' do
    it 'returns all the resources' do
      get :index
      expect(assigns(:resources)).to eq([resource1, resource2])
    end
  end

  describe '#show' do
    subject { get :index, params: { id: resource1.id } }

    before do
      subject
    end

    it 'returns the correct resource' do
      expect(assigns(:resource)).to eq(resource1)
    end

    it 'assigns a tag' do
      expect(assigns(:tag)).to be_a_new(Tag)
    end

    it 'assigns a review' do
      expect(assigns(:review)).to be_a_new(Review)
    end
  end

  describe '#new' do
  end

  describe '#create' do
  end

  describe '#edit' do
  end

  describe '#update' do
  end

  describe '#destroy' do
  end
end
