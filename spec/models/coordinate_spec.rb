require 'rails_helper'

RSpec.describe Coordinate do
  subject(:coordinate) { Coordinate.new(dress_season: '夏', owner: owner) }
  let(:owner) { FactoryGirl.create(:owner) }

  it { is_expected.to respond_to(:dress_season) }
  it { is_expected.to be_valid }

  describe 'dress season' do
    context 'when it is nil' do
      before { coordinate.dress_season = nil }

      it 'has an error on person name' do
        expect(coordinate).not_to be_valid
        expect(coordinate.errors[:dress_season].size).to eq(1)
      end
    end

    context 'when it is empty' do
      before { coordinate.dress_season = '' }

      it 'has an error on person name' do
        expect(coordinate).not_to be_valid
        expect(coordinate.errors[:dress_season].size).to eq(1)
      end
    end
  end
end
