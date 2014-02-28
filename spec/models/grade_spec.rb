require 'spec_helper'

describe Grade do
  describe 'Associations' do
    subject { build :grade }
    it { should respond_to :groups }
    it { should respond_to :workshops }
  end
end
