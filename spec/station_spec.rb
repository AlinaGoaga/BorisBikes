require 'station'

RSpec.describe DockingStation do
  before(:each) do
    @station = DockingStation.new
  end

  it { is_expected.to respond_to :bikes } # testing reader

  describe 'initialization' do
    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock_bike(Bike.new) }
      expect { docking_station.dock_bike(Bike.new) }.to raise_error 'Station full'
    end

    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times {@station.dock_bike(Bike.new)}
      expect { @station.dock_bike(Bike.new) }.to raise_error 'Docking station full'
    end
  end
end

describe '#dock_bike' do
  it 'returns a station that includes the bike which has just been docked' do
    bike = Bike.new
    expect(@station.dock_bike(bike)).to include(bike)
  end

  it 'raises an error when we try to add another bike if the station has 20 bikes already' do
    @station.capacity.times { @station.dock_bike(Bike.new) }
    expect { @station.dock_bike(Bike.new) }.to raise_error 'Station full'
  end
end

describe '#release_bike' do
  it 'releases a bike' do
    bike = Bike.new
    @station.dock_bike(bike) # docking the bike in the station
    expect(@station.release_bike).to eq bike
  end

  it 'always releases a working bike' do
    bike = Bike.new
    @station.dock_bike(bike)
    released_bike = @station.release_bike
    expect(released_bike.working?).to be true
  end

  it 'raises an error when there are no bikes available' do
    expect { @station.release_bike }.to raise_error 'No bikes available'
  end
end
end
