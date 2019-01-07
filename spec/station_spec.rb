require 'station'

RSpec.describe DockingStation do
  let(:bike) { double :bike }

  describe '#initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      allow(bike).to receive(:dock_bike)
      50.times { docking_station.dock_bike(bike) }
      expect { docking_station.dock_bike(bike) }.to raise_error 'Station full'
    end

    it 'defaults capacity' do
      allow(bike).to receive(:dock_bike)
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error 'Station full'
    end
  end

  describe '#dock_bike' do
    it 'returns a station that includes the bike which has just been docked' do
      allow(bike).to receive(:dock_bike)
      expect(subject.dock_bike(bike)).to include(bike)
    end

    it 'raises an error when we try to add another bike if the station has 20 bikes already' do
      allow(bike).to receive(:dock_bike)
      subject.capacity.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error 'Station full'
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      allow(bike).to receive(:broken?).and_return(false)
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'does not release broken bikes' do
      allow(bike).to receive(:broken?).and_return(true)
      subject.dock_bike(bike)
      expect { subject.release_bike }.to raise_error 'No working bikes available'
    end
  end
end
