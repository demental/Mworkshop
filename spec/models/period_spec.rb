require 'spec_helper'

describe Period do
  subject { Period.new }
  it 'can be persisted' do
    subject.save.should be_true
  end
end
