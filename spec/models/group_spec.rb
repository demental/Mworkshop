require 'spec_helper'

describe Group do

  describe 'Associations' do
    subject { build :group }
    it { should respond_to :grade }
    it { should respond_to :students }
  end

  describe 'Validation' do
    context 'Invalid Grade' do
      subject { build :group, grade: 'I am not valid' }
      it { should_not be_valid }
    end
  end

end
