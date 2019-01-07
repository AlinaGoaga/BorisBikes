require 'station'

describe Bike do
  describe '#report_broken' do
    it 'can be reported broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end

  describe '#broken?' do
    it 'can be checked to see if it is broken' do
      subject.report_broken
      expect(subject.broken?).to eq true
    end
  end
end
