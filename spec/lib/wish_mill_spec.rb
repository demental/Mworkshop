require 'spec_helper'

describe WishMill do

  describe '#initialize' do
    subject { WishMill.new(period) }

    context 'When passing a valid period' do
      let(:period) { create(:period) }
      it 'does not raise error' do
        expect { subject }.not_to raise_error
      end
    end

    context 'When passing an invalid period' do
      let(:period) { 'invalid parameter' }
      it 'raises error' do
        expect { subject }.to raise_error
      end
    end

  end

  describe '#call' do
    let(:first_period) { create(:period) }
    let(:boris)  { create(:student, happiness: boris_happiness) }
    let(:andrej) { create(:student, happiness: andrej_happiness) }
    let(:boxing) { create(:workshop, grades: [boris.grade], max_attendees: 1) }
    let(:roller) { create(:workshop, grades: [boris.grade, andrej.grade], max_attendees: 2) }
    context 'when Boris and Andrej want to access a too small workshop' do
      before do
        boris.wishes << build(:wish, period: first_period, workshop: boxing, weight: 2, wishgroup: 1)
        boris.wishes << build(:wish, period: first_period, workshop: roller, weight: 1, wishgroup: 1)
      end

      context 'when Boris was more happy before' do
        let(:boris_happiness) { 10 }
        let(:andrej_happiness) { 0 }
        it 'assigns Andrej to workshop' do
          workshop.attendees.should eq [andrej]
        end
      end
      context 'when Andrej was more happy before' do
        let(:boris_happiness) { 0 }
        let(:andrej_happiness) { 10 }
        it 'assigns Boris to workshop' do
          workshop.attendees.should eq [boris]
        end
      end
    end
  end

end