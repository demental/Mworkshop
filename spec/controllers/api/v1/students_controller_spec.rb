require 'spec_helper'
describe Api::V1::StudentsController do

  describe 'index' do

    subject { get 'index', format: 'json' }
    it { should be_success }

    context 'with 2 students' do
      before do
       2.times { create :student }
     end
      subject { JSON.parse( get('index', format: 'json').body ) }
      it { should have_key 'students' }
      it 'Renders all students' do
        subject['students'].size.should eq 2
      end
    end

  end

  describe 'show' do

    context 'with student called Toto' do
      let(:student){ create :student, first_name: 'Toto' }
      subject { JSON.parse( get('show', id: student, format: 'json').body ) }
      it 'get a student named Toto' do
        subject['student']['first_name'].should eq 'Toto'
      end
    end

    context 'with student who doesn\'t exist'  do
      subject { get('show', id: 1, format: 'json') }
      it 'raise an error' do
        expect{ subject }.to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

  end

  describe 'create' do
    let(:student_params){ {first_name: 'Mathieu', last_name:'Carrandié'} }
    subject{ post('create', student:student_params, format: 'json')}
    it {should be_success}
    it 'creates a new student' do
      expect{subject}.to change(Student, :count).by 1
    end
  end

  describe 'update' do
    let(:student_params){ {first_name: 'Mathieu'} }
    let(:student){ create :student, first_name: 'Toto' }
    subject{ put('update', id: student, student:student_params, format: 'json')}
    it {should be_success}
    it 'student name is Mathieu' do
      subject
      student.reload
      student.first_name.should eq 'Mathieu'
    end

    context 'allowing group change' do
      let(:other_group) { create :group }
      let(:student_params){ {group_id: other_group.id.to_s} }
      it 'allows group change' do
        subject
        student.reload
        student.group.id.should eq other_group.id
      end
    end
  end
end
