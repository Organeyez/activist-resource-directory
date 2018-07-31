require 'rails_helper'

RSpec.describe CollectionResourcesController, type: :controller do
  let(:user) { User.create(password: 'password', username: 'user1', email: 'user1@test.com') }
  let(:some_other_user) { User.create(password: 'password', username: 'not_owner', email: 'not_wner1@test.com') }
  let!(:collection1) { Collection.create(name: 'Collection' ,user_id: user.id) }
  let!(:collection2) { Collection.create(name: 'Another Collection' ,user_id: user.id) }
  let!(:collection3) { Collection.create(name: 'And another!' ,user_id: some_other_user.id) }

  describe '#create' do
    before do
      allow(controller).to receive(:current_user).and_return(user)
    end

    it 'returns the collections for the user on success' do
    end

    it 'redirects upon failure' do
    end
  end

  describe '#destroy' do
  end
end
