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

  describe '#available_workshops' do
    let(:period)  { create(:period) }
    let!(:boxing) { create(:workshop, period: period, max_attendees: 2) }
    let!(:roller) { create(:workshop, period: period, max_attendees: 1) }
    subject { period.available_workshops }
    context 'before anything assigned' do
      it { should match_array [boxing, roller] }
    end

    context 'when some workshop are full' do
      before { create(:assignment, workshop: roller) }
      it { should match_array [boxing] }
    end

    context 'when some workshop partially filled' do
      before { create(:assignment, workshop: boxing) }
      it { should match_array [boxing, roller] }
    end
  end
end
