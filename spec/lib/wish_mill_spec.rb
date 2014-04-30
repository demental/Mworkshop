require 'spec_helper'

describe WishMill do

  let(:first_period) { create(:period) }
  let(:boris)  { create(:student, happiness: boris_happiness) }
  let(:andrej) { create(:student, happiness: andrej_happiness) }
  let(:boxing) { create(:workshop, period: first_period, grades: [boris.grade], max_attendees: 1) }
  let(:roller) { create(:workshop, period: first_period, grades: [boris.grade, andrej.grade], max_attendees: 2) }
  let(:boris_happiness)  { 0 }
  let(:andrej_happiness) { 0 }

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

  describe '#set_assignments' do
    subject { WishMill.new(first_period).set_assignments(workshop, [boris, andrej]) }
    context 'with big enough workshop' do
      let(:workshop) { roller }
      it 'adds all the attendees' do
        subject
        workshop.attendees.size.should eq 2
      end
    end
  end

  describe '#call' do
    subject { WishMill.new(first_period).call }
    context 'when Boris and Andrej want to access a too small workshop' do
      before do
        andrej.wishes << build(:wish, period: first_period, workshop: boxing, weight: 1)
        boris.wishes  << build(:wish, period: first_period, workshop: boxing, weight: 1)
        boris.wishes  << build(:wish, period: first_period, workshop: roller, weight: 2)
      end

      context 'when Boris is happier than Andrej' do
        let(:boris_happiness)  { 10 }
        let(:andrej_happiness) { 0 }

        it 'assigns Andrej to workshop' do
          subject
          boxing.attendees.to_a.should eq [andrej]
        end
      end
      context 'when Andrej is happier than Boris' do
        let(:boris_happiness) { 0 }
        let(:andrej_happiness) { 10 }
        it 'assigns Boris to workshop' do
          subject
          boxing.attendees.to_a.should eq [boris]
        end
      end
    end
  end
end