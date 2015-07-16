require 'rails_helper'

RSpec.describe Photo do
  subject(:photo) { Photo.new(imageable: coordinate, image: uploaded_file) }

  let(:coordinate) { FactoryGirl.create(:coordinate) }

  include_context 'uploaded file'

  it { is_expected.to be_valid }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:image) }

  context 'image' do
    context 'without image' do
      before { photo.image = nil }

      it 'has an error on image' do
        expect(photo).not_to be_valid
        expect(photo.errors[:image].size).to eq 1
      end
    end
  end
end
