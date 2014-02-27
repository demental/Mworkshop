require 'spec_helper'

describe Period do

  describe 'Persistance' do
    subject { FactoryGirl.build :period }
    it 'can be persisted' do
      subject.save.should be_true
    end
  end

  describe 'Unicity of name' do
    before{ FactoryGirl.create :period, name:'Toto' }
    subject { FactoryGirl.build :period, name:'Toto' }
    it 'has a unique name' do
      subject.save.should be_false
    end
  end

end
