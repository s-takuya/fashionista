require 'rails_helper'

RSpec.describe CoordinatesController do
  describe 'GET index' do
    let(:beckham) { FactoryGirl.create(:coordinate) }
    let(:carmelo) { FactoryGirl.create(:coordinate, person_name: 'carmelo') }

    it 'assigns instance variable' do
      get :index
      expect(assigns(:coordinates)).to eq [beckham, carmelo]
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET show' do
    let(:coordinate) { FactoryGirl.create(:coordinate) }

    it 'assigns instance variable' do
      get :show, id: coordinate.id
      expect(assigns(:coordinate)).to eq coordinate
    end
  end
end
