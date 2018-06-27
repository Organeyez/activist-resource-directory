require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  def valid_attributes
    { title: 'Politics' }
  end

  describe '#index' do
    it 'returns an array of all categories' do
    end

    it 'renders the index view' do
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
