require 'rails_helper'

RSpec.describe OwnersController do
  let!(:owner) { FactoryGirl.create(:owner) }

  describe 'GET index' do
    it 'assings instance variable' do
      get :index
      expect(assigns(:owners)).to contain_exactly(owner)
    end
  end

  describe 'GET show' do
    let(:coordinate) { FactoryGirl.create(:coordinate, owner: owner) }

    it 'assigns instance variables' do
      get :show, id: owner.id
      expect(assigns(:owner)).to eq owner
      expect(assigns(:coordinates)).to contain_exactly(coordinate)
    end
  end
end
