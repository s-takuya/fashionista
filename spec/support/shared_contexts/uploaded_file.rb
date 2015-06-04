include ActionDispatch::TestProcess

RSpec.shared_context 'uploaded file' do
  let(:uploaded_file) do
    uploaded_file = fixture_file_upload('images/ハレアカラ.jpg', 'image/jpeg')
    allow(uploaded_file).to receive(:tempfile).and_return(uploaded_file)
    uploaded_file
  end
end
