require 'station'

describe Bike do
  it 'can be checked to see if it is working' do
    subject.working?
    expect(subject).to be_working
  end

  it 'can be reported broken' do
    subject.report_broken
    expect(subject).to be_broken
  end

  it 'can be checked to see if it is broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end
