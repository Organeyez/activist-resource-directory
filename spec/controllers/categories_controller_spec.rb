require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let!(:category1) { Category.create(title: 'Environment') }
  let!(:category2) { Category.create(title: 'Economics') }

  def valid_attributes
    { title: 'Politics' }
  end

  describe '#index' do
    subject { get :index }

    it 'returns an array of all categories' do
      subject
      assigns(:categories)
      expect(response.body).to eq([category2, category1])
    end

    it 'renders the index view' do
      expect(subject).to render_template('categories/index')
    end
  end

  describe '#show' do
    it 'returns the correct category' do
    end

    it 'returns the resources for the category' do
    end

    it 'renders the show view' do
    end
  end

  describe '#new' do
    it 'creates a new category' do
    end

    it 'renders the new view' do
    end
  end

  describe '#create' do
    it 'saves the new category upon success' do
    end

    it 'returns a 422 when not successful' do
    end
  end
end
