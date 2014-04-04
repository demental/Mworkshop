require 'spec_helper'

describe Workshop do
  describe 'Associations' do
    subject { build :workshop }
    it { should respond_to :wishes }
    it { should respond_to :assignments }
    it { should respond_to :grades }
    it { should respond_to :period }
  end

  describe 'Computed associations' do
    describe '#attendees' do
      let(:workshop) { create(:workshop) }
      let(:boris) { create(:student) }
      before do
        create(:assignment, workshop: workshop, student: boris)
      end
      subject { workshop.attendees.all.to_a }
      it { should match_array [boris] }
    end
  end
end
