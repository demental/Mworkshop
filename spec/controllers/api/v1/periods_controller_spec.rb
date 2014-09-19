require 'spec_helper'
describe Api::V1::PeriodsController do

  describe 'index' do

    subject { get 'index', format: 'json' }
    it { should be_success }

    context 'with 2 periods' do
      before do
       2.times { create :period }
     end
      subject { JSON.parse( get('index', format: 'json').body ) }
      it { should have_key 'periods' }
      it 'Renders all periods' do
        subject['periods'].size.should eq 2
      end
    end

  end

  describe 'show' do

    context 'with period called First' do
      let(:period){ create :period, name: 'First' }
      subject { JSON.parse( get('show', id: period, format: 'json').body ) }
      it 'get a period named First' do
        # binding.pry
        subject['period']['name'].should eq 'First'
      end
    end

    context 'with period who doesn\'t exist'  do
      subject { get('show', id: 1, format: 'json') }
      it 'raise an error' do
        expect{ subject }.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

  end

  describe 'create' do
    let(:period_params){ {name: 'First', state:'open'} }
    subject{ post('create', period:period_params, format: 'json')}
    it {should be_success}
    it 'creates a new period' do
      expect{subject}.to change(Period, :count).by 1
    end
  end

  describe 'update' do
    let(:period_params){ {name: 'Second'} }
    let(:period){ create :period, name: 'First' }
    subject{ put('update', id: period, period:period_params, format: 'json')}
    it {should be_success}
    it 'period name is Second' do
      subject
      period.reload
      period.name.should eq 'Second'
    end
  end

end