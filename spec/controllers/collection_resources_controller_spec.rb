require 'rails_helper'

RSpec.describe CollectionResourcesController, type: :controller do
  let(:user) { User.create(password: 'password', username: 'user1', email: 'user1@test.com') }
  let(:some_other_user) { User.create(password: 'password', username: 'not_owner', email: 'not_wner1@test.com') }
  let(:category1) { Category.create(title: 'Environment') }
  let!(:resource1) do
    Resource.create(title: 'what is happening',
                    description: 'whatwhatwhat',
                    url: 'what.what.com',
                    author_id: user.id,
                    category_id: category1.id)
  end
  let!(:collection1) { Collection.create(name: 'Collection', owner_id: user.id) }
  let!(:collection2) { Collection.create(name: 'Another Collection', owner_id: user.id) }
  let!(:collection3) { Collection.create(name: 'And another!', owner_id: some_other_user.id) }
  describe '#create' do
    before do
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'on sucess' do
      it 'displays the right message upon success' do
          post :create, params: { user_id: user.id, collection_resource: { resource_id: resource1.id, collection_id: collection1.id } }
          expect(assigns(:collection)).to eq(collection1)
          expect(flash[:success]).to be_present
          expect(response).to redirect_to(user_collection_path(id: collection1.id, user_id: user.id))
      end
    end

    context 'on failure' do

      # this should fail when the resource is already in that collection
      before do
        post :create, params: { user_id: user.id, collection_resource: { resource_id: resource1.id, collection_id: collection1.id } }
      end

      it 'displays the right message upon failure' do
        post :create, params: { user_id: user.id, collection_resource: { resource_id: resource1.id, collection_id: collection1.id } }

        expect(flash[:alert]).to be_present
        expect(response).to redirect_to(user_collection_path(id: collection1.id, user_id: user.id))
      end
    end
  end

  describe '#destroy' do
    before do
      allow(controller).to receive(:current_user).and_return(user)
    end

    let!(:collection_resource) { CollectionResource.create(collection_id: collection2.id, resource_id: resource1.id) }

    it 'deletes the collection resource' do
      expect { delete :destroy, params: { id: collection_resource.id, user_id: user.id } }.to change(CollectionResource, :count).by(-1)
    end
  end
end
