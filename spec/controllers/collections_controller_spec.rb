require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
  let(:owner) { User.create(password: 'password', username: 'owner1', email: 'owner1@test.com') }
  let(:some_other_user) { User.create(password: 'password', username: 'not_owner', email: 'not_wner1@test.com') }
  let(:collection1) { Collection.create(name: 'Collection' ,owner_id: owner.id) }
  let(:collection2) { Collection.create(name: 'Another Collection' ,owner_id: owner.id) }
  let(:collection3) { Collection.create(name: 'And another!' ,owner_id: some_other_user.id) }
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

  let(:collection_resource1) { CollectionResource.create(collection_resource: collection1, collection_id: collection1.id, resource_id: resource1) }
  let(:collection_resource2) { CollectionResource.create(collection_resource: collection1, collection_id: collection1.id, resource_id: resource2) }

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
