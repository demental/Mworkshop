require 'spec_helper'

describe Student do
  describe 'Associations' do
    subject { build :student }
    it { should respond_to :wishes }
    it { should respond_to :assignments }
    it { should respond_to :group }
  end
end
