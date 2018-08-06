require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  let(:user) { User.create(password: 'password', username: 'user1', email: 'user1@test.com') }
  let(:author) { User.create(password: 'password', username: 'author1', email: 'author1@test.com') }
  let!(:category1) { Category.create(title: 'Environment') }
  let!(:resource1) do
  Resource.create(title: 'what is happening',
                  description: 'whatwhatwhat',
                  url: 'what.what.com',
                  author_id: author.id,
                  category_id: category1.id)
end

  let!(:resource2) do
    Resource.create(title: 'and stuff is happening',
                    description: 'whatwhat',
                    url: 'where.what.com',
                    author_id: author.id,
                    category_id: category1.id)
  end
  let!(:resource3) do
    Resource.create(title: 'stuff happening everywhere',
                    description: 'whatwhat',
                    url: 'where.what.com',
                    author_id: author.id,
                    category_id: category1.id)
  end

  let!(:favorite1) { Favorite.create(resource_id: resource1.id, fan_id: user.id ) }
  let!(:favorite2) { Favorite.create(resource_id: resource2.id, fan_id: user.id ) }

  describe '#index' do
    subject { get :index, params: { user_id: user.id } }

    before do
      subject
    end

    it 'assigns the correct user' do
      expect(assigns(:user)).to eq(user)
    end

    it 'returns the user\'s favorite resources' do
      expect(assigns(:favorited_resources)).to eq([resource2, resource1])
    end
  end

  describe '#create' do
    before do
      allow(controller).to receive(:current_user).and_return(user)
    end

    context 'when the favorite does not already exist' do
      it 'creates a new favorite' do
        expect { post :create, params: { resource_id: resource3.id, user_id: user.id } }.to change(Favorite, :count).by(1)
        expect(response).to redirect_to user_favorites_path
      end
    end

    context 'when the favorite already exists' do
      it 'creates a new favorite' do
        expect { post :create, params: { resource_id: resource2.id, user_id: user.id } }.not_to change(Favorite, :count)
        expect(response).to redirect_to user_favorites_path
      end
    end
  end

  describe '#destroy' do
    it 'deletes the favorite' do
      expect { post :destroy, params: { id: resource2.id, user_id: user.id } }.to change(Favorite, :count).by(1)
      expect(current_user.favorited_resources).not to include(resource2)
      expect(response).to redirect_to user_favorites_path
    end
  end
end
