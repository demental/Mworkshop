require 'spec_helper'

describe Period do

  describe 'Associations' do
    subject { build :period }
    it { should respond_to :workshops }
    it { should respond_to :wishes }
    it { should respond_to :assignments }
  end
  describe 'Persistance' do
    subject { build :period }
    it 'can be persisted' do
      subject.save.should be_true
    end
  end

  describe 'Unicity of name' do
    before { create :period, name:'Toto' }
    subject { build :period, name:'Toto' }
    it 'has a unique name' do
      subject.save.should be_false
    end
  end

end
