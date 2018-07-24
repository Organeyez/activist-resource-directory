require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category1) { Category.create(title: 'Environment') }
  let!(:category2) { Category.create(title: 'Economics') }
  let(:author) do
    User.create(password: 'password',
                username: 'author1',
                email: 'author1@test.com')
  end
  let(:resource1) do
    Resource.create(title: 'what is happening',
                    description: 'whatwhatwhat',
                    url: 'what.what.com',
                    author_id: author.id,
                    category_id: category1.id)
  end

  let(:resource2) do
    Resource.create(title: 'where is stuff happening',
                    description: 'whatwhat',
                    url: 'where.what.com',
                    author_id: author.id,
                    category_id: category1.id)
  end

  describe '#index' do
    subject { get :index }

    it 'returns successfully' do
      subject
      expect(response).to be_success
    end

    it 'returns an array of all categories' do
      subject
      expect(assigns(:categories)).to eq([category2, category1])
    end

    it 'renders the index view' do
      expect(subject).to render_template('categories/index')
    end
  end

  describe '#show' do
    subject { get :show, params: { id: category1.id } }

    before do
      subject
    end

    it 'returns successfully' do
      expect(response).to be_success
    end

    it 'returns the correct category' do
      expect(assigns(:category)).to eq(category1)
    end

    it 'returns the resources for the category' do
      expect(assigns(:resources)).to eq([resource1, resource2])
    end

    it 'renders the show view' do
      expect(response).to render_template('categories/show')
    end
  end

  describe '#new' do
    before do
      post :new, params: { title: 'What happens next?' }
    end
    it 'creates a new category when the title is present' do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders the new view' do
      expect(response).to render_template('categories/new')
    end
  end

  describe '#create' do
    it 'saves the new category upon success' do
      valid_params = { title: 'A New Category' }
      expect { post :create, params: { category: valid_params } }. to change(Category, :count).by(1)
    end

    it 'returns a 422 when not successful' do
      invalid_params = { title: '' }
      post :create, params: { category: invalid_params }
      expect(response.status). to eq(422)
    end
  end
end
