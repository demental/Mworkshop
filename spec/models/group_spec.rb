require 'spec_helper'

describe Group do
  describe 'Associations' do
    subject { build :group }
    it { should respond_to :grade }
    it { should respond_to :students }
  end
end
