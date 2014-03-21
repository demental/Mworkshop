require 'spec_helper'

describe Workshop do
  describe 'Associations' do
    subject { build :workshop }
    it { should respond_to :wishes }
    it { should respond_to :assignments }
    it { should respond_to :grades }
    it { should respond_to :period }
  end
end
