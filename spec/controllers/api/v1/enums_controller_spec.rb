require 'spec_helper'
describe Api::V1::EnumsController do

  describe 'index' do

    context 'http response' do
      subject { get 'index', format: 'json' }
      it { should be_success }
    end

    context 'response body' do
      subject { JSON.parse( get('index', format: 'json').body ) }
      it { should have_key 'grades' }
      it 'Renders all grades' do
        subject['grades'].size.should eq Settings['grades'].size
      end
    end
  end
end
