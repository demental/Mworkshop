require 'spec_helper'
describe Api::V1::GroupsController do

  let(:existing_grade){ Settings['grades'].last }

  describe 'index' do

    subject { get 'index', format: 'json' }
    it { should be_success }

    context 'with some groups' do
      before do
       2.times { create :group }
     end
      subject { JSON.parse( get('index', format: 'json').body ) }
      it { should have_key 'groups' }
      it 'Renders all groups' do
        subject['groups'].size.should eq 2
      end
    end

  end

  describe 'show' do

    context 'when group exist' do
      let(:group){ create :group, name: 'cm1 1' }
      subject { JSON.parse( get('show', id: group, format: 'json').body ) }
      it 'renders a group' do
        subject['group']['name'].should eq 'cm1 1'
      end
    end

    context 'when group doesn\'t exist'  do
      subject { get('show', id: 1, format: 'json') }
      it 'raise an error' do
        expect{ subject }.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

  end

  describe 'create' do
    let(:group_params){ {name: 'cm1 1', grade: existing_grade} }
    subject{ post('create', group:group_params, format: 'json')}
    it {should be_success}
    it 'creates a new group' do
      expect{subject}.to change(Group, :count).by 1
    end
  end

  describe 'update' do
    let(:group_params){ {name: 'cm1 2'} }
    let(:group){ create :group, name: 'cm1 1' }
    subject{ put('update', id: group, group: group_params, format: 'json')}
    it {should be_success}
    it 'group is updated' do
      subject
      group.reload
      group.name.should eq 'cm1 2'
    end
  end

end