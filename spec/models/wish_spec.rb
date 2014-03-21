require 'spec_helper'

describe Wish do
  describe 'Associations' do
    subject { build :wish }
    it { should respond_to :workshop }
    it { should respond_to :period }
    it { should respond_to :student }
  end
end
