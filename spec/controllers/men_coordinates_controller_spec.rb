require 'rails_helper'

RSpec.describe MenCoordinatesController do
  let(:coordinate) { FactoryGirl.create(:coordinate, owner: owner) }
  let(:owner) { FactoryGirl.create(:owner) }

  describe 'GET index' do
    it 'assigns instance variable' do
      get :index, owner_id: owner.id
      expect(assigns(:coordinates)).to contain_exactly(coordinate)
    end
  end

  describe 'GET show' do
    it 'assigns instance variable' do
      get :show, id: coordinate.id
      expect(assigns(:coordinate)).to eq coordinate
    end
  end
end
