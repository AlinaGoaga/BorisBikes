require 'station'

describe Bike do
  # describe '#working?' do
  #   it 'checks to see if the bike is functional working' do
  #     expect(subject).to be_working
  #   end
  # end

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
