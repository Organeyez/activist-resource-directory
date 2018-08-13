require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
  let(:owner) { User.create(password: 'password', username: 'owner1', email: 'owner1@test.com') }
  let(:some_other_user) { User.create(password: 'password', username: 'not_owner', email: 'not_wner1@test.com') }
  let(:category1) { Category.create(title: 'Environment') }
  let!(:resource1) do
    Resource.create(title: 'what is happening',
                    description: 'whatwhatwhat',
                    url: 'what.what.com',
                    author_id: owner.id,
                    category_id: category1.id)
  end

  let!(:resource2) do
    Resource.create(title: 'where is stuff happening',
                    description: 'whatwhat',
                    url: 'where.what.com',
                    author_id: owner.id,
                    category_id: category1.id)
  end
  let!(:collection1) { Collection.create(name: 'Collection' ,owner_id: owner.id) }
  let!(:collection2) { Collection.create(name: 'Another Collection' ,owner_id: owner.id) }
  let!(:collection3) { Collection.create(name: 'And another!' ,owner_id: some_other_user.id) }
  let!(:collection_resource1) { CollectionResource.create(collection_id: collection1.id, resource_id: resource1.id) }
  let!(:collection_resource2) { CollectionResource.create(collection_id: collection1.id, resource_id: resource2.id) }

  describe '#index' do
    subject { get :index, params: { user_id: owner.id } }

    it 'returns successfully' do
      subject
      expect(response).to be_success
    end

    it 'returns an array of collections for the user' do
      subject
      expect(assigns(:collections)).to eq([collection2, collection1])
    end

    it 'renders the index view' do
      expect(subject).to render_template('collections/index')
    end
  end

  describe '#show' do

    subject { get :show, params: { user_id: owner.id, id: collection1.id } }

    before do
      allow(controller).to receive(:current_user).and_return(owner)
      subject
    end

    it 'returns successfully' do
      expect(response).to be_success
    end

    it 'returns the correct collection' do
      expect(assigns(:collection)).to eq(collection1)
    end

    it 'returns the collection owner' do
      expect(assigns(:user)).to eq(owner)
    end

    it 'returns a new collection resource' do
      expect(assigns(:collection_resource)).to be_a_new(CollectionResource)
    end

    it 'returns the resources for the category' do
      expect(assigns(:resources)).to eq([resource1, resource2])
    end

    it 'renders the show view' do
      expect(response).to render_template('collections/show')
    end
  end

  describe '#new' do
    before do
      post :new, params: { name: 'Education', user_id: owner.id }
    end
    it 'creates a new collection when the title is present' do
      expect(assigns(:collection)).to be_a_new(Collection)
    end

    it 'renders the new view' do
      expect(response).to render_template('layouts/application')
    end
  end

  describe '#create' do
    before do
      allow(controller).to receive(:current_user).and_return(owner)
    end

    it 'saves the new collection upon success' do
      valid_params = { name: 'A New Collection', owner_id: owner.id }
      expect { post :create, params: { user_id: owner.id, collection: valid_params } }. to change(Collection, :count).by(1)
    end

    it 'returns a 302 when not successful' do
      invalid_params = { name: 23, owner_id: owner.id }
      post :create, params: { user_id: owner.id, collection: invalid_params }
      expect(response.status). to eq(302)
    end
  end

  describe '#edit' do
    subject { get :edit, params: { user_id: owner.id, id: collection1.id } }

    before do
      subject
    end

    it 'returns the requested collection' do
      expect(assigns(:collection)).to eq(collection1)
    end

    it 'renders the edit view' do
      expect(response).to render_template('collections/edit')
    end
  end

  describe '#update' do
    before do
      allow(controller).to receive(:current_user).and_return(owner)
    end

    context 'with good data' do
      it 'updates the collection and redirects' do
        patch :update, params: { user_id: owner.id, id: collection2.id, collection: { name: 'A New Name'} }
        expect(collection2.reload.name).to eq('A New Name')
        expect(response).to be_redirect
      end
    end

    context 'with bad data' do
      it 'does not change the collection, and re-renders the form' do
        patch :update, params: { user_id: owner.id, id: collection2.id, collection: { name: '' } }
        expect(response).not_to be_redirect
      end
    end
  end

  describe '#destroy' do
    before do
      allow(controller).to receive(:current_user).and_return(owner)
    end

    it 'deletes the correct collection and redirects' do
      expect { delete :destroy, params: { user_id: owner.id, id: collection2.id } }. to change(Collection, :count).by(-1)
      expect(response).to be_redirect
    end
  end
end
