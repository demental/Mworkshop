require 'spec_helper'

describe Student do
  describe 'Associations' do
    subject { build :student }
    it { should respond_to :wishes }
    it { should respond_to :assignments }
    it { should respond_to :group }
    it { should respond_to :grade }
  end

  describe 'scopes' do
    describe '#wishing' do
      let(:boxing) { create(:workshop) }
      let(:roller) { create(:workshop) }
      let(:sewing) { create(:workshop) }
      let(:boris)  { create(:student) }
      let(:sergej) { create(:student) }
      before do
        boris.wishes << create(:wish, workshop: boxing, wish_group: 1, weight: 1)
        boris.wishes << create(:wish, workshop: roller, wish_group: 2, weight: 2)
        sergej.wishes << create(:wish, workshop: roller, wish_group: 1, weight: 1)
      end
      context "when no weight specified" do
        it "returns the students that chose the workshop" do
          Student.wishing(roller).should match_array [sergej, boris]
          Student.wishing(boxing).should match_array [boris]
          Student.wishing(sewing).should match_array []
        end
      end
      context "when weight specified" do
        it "returns the students that chose the workshop only for that weight" do
          Student.wishing(roller, 1).should match_array [sergej]
          Student.wishing(boxing, 2).should match_array []
        end
      end
    end
  end
end
