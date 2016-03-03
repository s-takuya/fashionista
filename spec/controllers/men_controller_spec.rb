require 'rails_helper'

RSpec.describe MenController do
  let!(:owner) { FactoryGirl.create(:owner) }

  describe 'GET index' do
    it 'assigns instance variable' do
      get :index
      expect(assigns(:owners)).to contain_exactly(owner)
    end
  end

  describe 'GET show' do
    let(:coordinate) { FactoryGirl.create(:coordinate, owner: owner) }

    it 'assigns instance variable' do
      get :show, id: owner.id
      expect(assigns(:owner)).to eq owner
      expect(assigns(:coordinates)).to contain_exactly(coordinate)
    end
  end
end
