require 'spec_helper'
describe Api::V1::WorkshopsController do


  describe 'index' do

    subject { get 'index', format: 'json' }
    it { should be_success }

    context 'with some groups' do
      before do
       2.times { create :workshop }
     end
      subject { JSON.parse( get('index', format: 'json').body ) }
      it { should have_key 'workshops' }
      it 'Renders all workshops' do
        subject['workshops'].size.should eq 2
      end
    end

  end

  describe 'show' do

    context 'when workshop exist' do
      let(:workshop){ create :workshop, name: 'boxing', grades: ['cp','ce1'] }
      subject { JSON.parse( get('show', id: workshop, format: 'json').body ) }
      it 'renders a workshop' do
        subject['workshop']['name'].should eq 'boxing'
        subject['workshop']['grades'].first.should eq 'cp'
      end
    end

    context 'when workshop doesn\'t exist'  do
      subject { get('show', id: 1, format: 'json') }
      it 'raise an error' do
        expect{ subject }.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

  end

  describe 'create' do
    let(:workshop_params){ {name: 'boxe', grades: ['cm1','cm2']} }
    subject{ post('create', workshop: workshop_params, format: 'json')}
    it {should be_success}
    it 'creates a new workshop' do
      expect{subject}.to change(Workshop, :count).by 1
    end
  end

  describe 'update' do
    let(:workshop_params){ {name: 'skating'} }
    let(:workshop){ create :workshop, name: 'boxing' }
    subject{ put('update', id: workshop, workshop: workshop_params, format: 'json')}
    it {should be_success}
    it 'group is updated' do
      subject
      workshop.reload
      workshop.name.should eq 'skating'
    end
  end
end
