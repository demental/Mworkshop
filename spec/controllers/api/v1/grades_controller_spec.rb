require 'spec_helper'
describe Api::V1::GradesController do

  describe 'index' do

    context 'http response' do
      subject { get 'index', format: 'json' }
      it { should be_success }
    end

    context 'response body' do
      subject { JSON.parse( get('index', format: 'json').body ) }
      it { binding.pry; should have_key 'grades' }
      it 'Renders all grades' do
        subject['grades'].size.should eq Settings['grades'].size
      end
    end

  end

  describe 'show', pending: true do

    context 'when grade exist' do
      subject { JSON.parse( get('show', id: 1, format: 'json').body ) }
      it 'renders a grade' do
        subject['grade']['name'].should eq 'cm1 1'
      end
    end

    context 'when grade doesn\'t exist'  do
      subject { get('show', id: 1, format: 'json') }
      it 'raise an error' do
        expect{ subject }.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

  end

end