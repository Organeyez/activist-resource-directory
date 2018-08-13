require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  let(:owner) { User.create(password: 'password', username: 'owner1', email: 'owner1@test.com') }
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

  describe '#index' do
    it 'returns all the resources' do
      get :index
      expect(assigns(:resources)).to eq([resource1, resource2])
    end
  end

  describe '#show' do
    subject { get :show, params: { id: resource1.id } }

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
    before do
      post :new, params: { title: 'Education At Its Best',
                           description: 'Read to find out',
                           url: 'someurl@test.com',
                           category_id: category1.id,
                           user_id: owner.id }
    end
    it 'creates a new resource when the title is present' do
      expect(assigns(:resource)).to be_a_new(Resource)
    end

    it 'renders the new view' do
      expect(response).to render_template('resources/new')
    end
  end

  describe '#create' do
    before do
      allow(controller).to receive(:current_user).and_return(owner)
    end

    it 'saves the new resource upon success' do
      valid_params = { title: 'Education At Its Worst',
                       description: 'Maybe skip this one.',
                       url: 'someurl2@test.com',
                       category_id: category1.id,
                       user_id: owner.id }
      expect { post :create, params: { resource: valid_params } }. to change(Resource, :count).by(1)
    end

    it 'returns a 422 when not successful' do
      invalid_params = { title: '',
                       description: 'It is a mystery.',
                       url: 'someurl3@test.com',
                       category_id: category1.id,
                       user_id: owner.id }
      post :create, params: { resource: invalid_params }
      expect(response.status). to eq(422)
    end
  end

  describe '#edit' do
    subject { get :edit, params: { user_id: owner.id, id: resource2.id } }

    before do
      subject
    end

    it 'returns the requested collection' do
      expect(assigns(:resource)).to eq(resource2)
    end

    it 'renders the edit view' do
      expect(response).to render_template('resources/edit')
    end
  end

  describe '#update' do
    context 'with good data' do
      it 'updates the resource and redirects' do
        patch :update, params: { id: resource2.id, resource: { title: 'Abolish College', description: 'Gonna get weird.' } }
        expect(resource2.reload.title).to eq('Abolish College')
        expect(resource2.reload.description).to eq('Gonna get weird.')
        expect(response).to be_redirect
      end
    end

    context 'with bad data' do
      it 'does not change the resource, and re-renders the form' do
        patch :update, params: { id: resource2.id, resource: { title: '', description: '' } }
        expect(response).not_to be_redirect
      end
    end
  end

  describe '#destroy' do
    before do
      allow(controller).to receive(:current_user).and_return(owner)
    end

    it 'deletes the correct resource and redirects' do
      expect { delete :destroy, params: { id: resource2.id } }. to change(Resource, :count).by(-1)
      expect(response).to be_redirect
    end
  end
end
