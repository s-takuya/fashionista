require 'rails_helper'

RSpec.describe Coordinate do
  subject(:coordinate) { FactoryGirl.create(:coordinate) }

  it { is_expected.to respond_to(:person_name) }
  it { is_expected.to respond_to(:occupation) }
  it { is_expected.to respond_to(:dress_season) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to be_valid }

  describe 'person name' do
    context 'when it is nil' do
      before { coordinate.person_name = nil }

      it 'has an error on person name' do
        expect(coordinate).not_to be_valid
        expect(coordinate.errors[:person_name].size).to eq(1)
      end
    end

    context 'when it is empty' do
      before { coordinate.person_name = '' }

      it 'has an error on person name' do
        expect(coordinate).not_to be_valid
        expect(coordinate.errors[:person_name].size).to eq(1)
      end
    end
  end

  describe 'occupation' do
    context 'when it is nil' do
      before { coordinate.occupation = nil }

      it 'has an error on person name' do
        expect(coordinate).not_to be_valid
        expect(coordinate.errors[:occupation].size).to eq(1)
      end
    end

    context 'when it is empty' do
      before { coordinate.occupation = '' }

      it 'has an error on person name' do
        expect(coordinate).not_to be_valid
        expect(coordinate.errors[:occupation].size).to eq(1)
      end
    end
  end

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

  describe 'image' do
    context 'when it is nil' do
      before { coordinate.image = nil }

      it 'has an error on image' do
        expect(coordinate).not_to be_valid
        expect(coordinate.errors[:image].size).to eq(1)
      end
    end
  end
end
