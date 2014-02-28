require 'spec_helper'

describe Assignment do
  describe 'Associations' do
    subject { build :assignment }
    it { should respond_to :student }
    it { should respond_to :workshop }
    it { should respond_to :period }
  end
end
